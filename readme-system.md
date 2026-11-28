# Aariva Punch — System & Data Flow

Aariva Punch is a branded fork of [Kimai](https://www.kimai.org), a professional open-source time-tracking application. This document describes how the system is deployed, how requests move through the stack, and how domain data flows from timesheets into invoices and exports.

## Stack at a glance

| Layer | Technology |
| --- | --- |
| Application | Kimai core (PHP 8.2–8.5) |
| Framework | Symfony 6.4 |
| Persistence | Doctrine ORM → MySQL 8.3 |
| Templates / UI | Twig + Bootstrap / Tabler |
| API | FOSRestBundle, JMS Serializer, NelmioApiDoc |
| Frontend build | Webpack Encore (`pnpm`) |
| Local packaging | Docker Compose + Apache image |

**Aariva-specific changes today:** branding (`config/packages/aariva.yaml`), Docker helper scripts (`docker-start.sh`, `docker-compose.yml`), and local port **8001**.

---

## 1. Deployment topology

```
                    ┌─────────────────────┐
  Browser / API ───►│  kimai (Apache/PHP) │──► volumes: data, plugins
       clients      │  localhost:8001     │
                    └──────────┬──────────┘
                               │ DATABASE_URL
                               ▼
                    ┌─────────────────────┐
  docker-start.sh ─►│  sqldb (MySQL 8.3)  │──► volume: mysql
                    └─────────────────────┘
```

### How to run locally

```bash
./docker-start.sh
# or: docker compose --env-file .env.docker up -d --build
```

On first boot the container entrypoint runs `kimai:install` and creates the admin user from `ADMIN_EMAIL` / `ADMIN_PASSWORD` in `.env.docker`.

### Surfaces

| Path | Purpose |
| --- | --- |
| `/{locale}/…` | Web UI (session auth) |
| `/api/…` | JSON REST API (token auth) |
| `/api/doc` | OpenAPI / Stoplight docs |
| `/auth/…` | 2FA and auth helpers |
| `localhost:8001` | Published HTTP port |

### Runtime configuration

| Key | Role |
| --- | --- |
| `DATABASE_URL` | MySQL DSN → `sqldb` |
| `APP_SECRET` | Symfony secret |
| `ADMINMAIL` / `ADMINPASS` | First-boot admin |
| `MAILER_URL` | Outbound mail (optional; default null transport) |
| Volumes `data` / `plugins` | Uploads + plugin code under `var/` |

---

## 2. Request / system flow

Every authenticated call follows the same layered path:

```
public/index.php
        │
        ▼
   Symfony Kernel
        │
        ▼
   Security firewall
   ├── api          (stateless · AccessToken / TokenAuthenticator)
   └── secured_area (session · form login · SAML · LDAP · 2FA)
        │
        ▼
   Controller
   ├── src/Controller/*   → Web UI
   └── src/API/*          → REST
        │
        ├──► Domain service (TimesheetService, InvoiceService, …)
        │         ├── Voters (ACL + roles)
        │         ├── Validator / Lockdown
        │         ├── EventDispatcher (plugins, webhooks)
        │         └── Repository (Doctrine)
        │                   │
        │                   ▼
        │                 MySQL (kimai2_* tables)
        │
        └──► Response (Twig HTML or JSON)
```

### Web UI path

- Controllers in `src/Controller/` with attribute routes under `/{_locale}`.
- Forms submit into domain services; Twig templates render Bootstrap/Tabler UI.
- Assets are built with Webpack Encore into `public/build/` (do not commit regenerated assets unless following project rules).

### API path

- Controllers in `src/API/` under prefix `/api`.
- Stateless firewall: `AccessTokenHandler` + `TokenAuthenticator`.
- JMS Serializer groups expand or collapse nested entities (`Default` vs `Expanded`).

### Auth path

Supported mechanisms:

- Form login (CSRF enabled, login throttling: 5 attempts / 5 minutes)
- SAML (`SamlAuthenticator`)
- LDAP (chain user provider)
- API access tokens
- Login links (password reset / magic link)
- 2FA TOTP (`scheb_2fa`)

Role hierarchy:

```
ROLE_USER → ROLE_TEAMLEAD → ROLE_ADMIN → ROLE_SUPER_ADMIN
```

Fine-grained permissions are defined in `config/packages/kimai.yaml` (permission sets) and enforced by voters in `src/Voter/` (Timesheet, Project, Customer, Team, Invoice, …). **Teams** are the main visibility boundary across customers, projects, and activities.

---

## 3. Domain data model

The core fact table is **`kimai2_timesheet`**. Everything else either scopes who can see work, or turns timesheets into money/documents.

```
Customer
   └── Project
          └── Activity (optional project scope; can also be global)
                 │
User ────────────┼──► Timesheet ◄── Tag (M2M)
                 │         │
Team ◄── User    │         ├── Rates (hourly / factors)
  │              │         ├── Meta fields
  ├── Customer   │         │
  ├── Project    │         ├──► Invoice
  └── Activity   │         └──► Export / Reporting

WorkingTime ── User + date (contracts / overtime)
Configuration ── system key/value
Role / RolePermission ── customizable ACL matrix
AccessToken ── User (API auth)
```

### Entity map

| Entity | Table | Key relations | Notes |
| --- | --- | --- | --- |
| User | `kimai2_users` | Teams, Preferences, AccessToken | Internal / LDAP / SAML |
| Customer | `kimai2_customers` | Projects, Teams, Rates, Meta | Budget + invoice template |
| Project | `kimai2_projects` | Customer*, Teams, Activities | Budget, comments, rates |
| Activity | `kimai2_activities` | Project?, Teams, Rates | Global or project-scoped |
| Timesheet | `kimai2_timesheet` | User*, Project*, Activity*, Tags | begin/end, duration, rate, billable |
| Team / TeamMember | `kimai2_teams` / `kimai2_users_teams` | Users ↔ Customers/Projects/Activities | Visibility boundary |
| Invoice | `kimai2_invoices` | Customer, User, Meta | Rendered from timesheet items |
| WorkingTime | working-time entity | User + date | Contracts / overtime modes |
| Configuration | `kimai2_configuration` | key/value | System settings overlay |
| Role / RolePermission | `kimai2_roles*` | permission grants | Customizable ACL matrix |

Timesheet rows store timezone-aware begin/end, a derived `date_tz` for stats, duration, break, rate / internal rate, and billable mode (`auto` / `yes` / `no`).

---

## 4. Timesheet data flow (write path)

Orchestrated by `App\Timesheet\TimesheetService`.

Tracking modes (`src/Timesheet/TrackingMode/`):

- **default** — classic start/stop or manual duration
- **duration fixed begin** — duration-oriented entry
- **punch-in / punch-out** — kiosk-style punching

```
UI / API (start · stop · edit)
        │
        ▼
 TimesheetService
        ├── TrackingMode.create / prepare
        ├── Auth check (start | create | edit)
        ├── Validator (+ LockdownService)
        ├── RoundingService (begin / end / duration)
        ├── RateService (hourly rates + weekday factors)
        ├── Pre/Post domain events  ──► plugins / webhooks
        └── TimesheetRepository.save (transaction)
```

### Start / create

1. `createNewTimesheet(user)` + active `TrackingMode::create`
2. `TimesheetMetaDefinitionEvent` (custom fields)
3. Permission check: `start` (running) or `create`
4. Validate + normalize timezone
5. `TimesheetCreatePreEvent` → `repository.save` → `TimesheetCreatePostEvent`
6. If running: `stopActiveEntries` respecting `active_entries.hard_limit`

### Stop / settle

1. Set `end = now` in the user’s timezone
2. Rounding adjusts begin/end/duration
3. Rate service computes rate / internal rate
4. `TimesheetStopPreEvent` → save → `TimesheetStopPostEvent`
5. Billable mode resolved
6. Downstream consumers (invoice / export) can pick up the settled row

---

## 5. Downstream value flows

### Invoicing

```
Billable timesheets (query)
        │
        ▼
 InvoiceModelFactory / InvoiceService
        ├── Calculator
        ├── Number generator
        ├── Renderer (Twig / PDF via mPDF)
        ├── Persist Invoice entity
        └── Mark timesheet items exported
```

Service: `App\Invoice\InvoiceService`. PDF rendering uses an SSRF-safe HTTP client for remote logos.

### Export & reporting

- `App\Export\ServiceExport` + column templates; CSV / spreadsheet / PDF renderers
- Reporting controllers aggregate repository statistic queries (indexes on user, `date_tz`, project, activity)
- `WorkingTime` overlays contracts and overtime modes on user calendars

---

## 6. Security & extension model

### Authorization layers

| Layer | Mechanism |
| --- | --- |
| Firewall | `api` (token) vs `secured_area` (session) |
| Roles | USER / TEAMLEAD / ADMIN / SUPER_ADMIN |
| Permissions | Sets in `config/packages/kimai.yaml` |
| Voters | Entity-level decisions in `src/Voter/` |
| Teams | M2M visibility on customers / projects / activities |
| 2FA | TOTP via scheb_2fa |

Access decision strategy is **unanimous** (any denying voter blocks access).

### Extensibility

| Hook | Location |
| --- | --- |
| Plugins | `var/plugins` (Docker volume) · `PluginManager` |
| Domain events | `src/Event/*` (~120 classes) + `EventSubscriber` |
| Webhooks | `AsWebhook` attribute |
| Meta fields | Customer / Project / Activity / Timesheet / Invoice meta |
| Tracking modes | `src/Timesheet/TrackingMode/*` |
| Invoice renderers | `src/Invoice/Renderer/*` |

Business logic should stay in services, not controllers. Plugins and subscribers hang off the event bus so core upgrades remain possible.

---

## 7. Repository map (where to look)

| Path | Role |
| --- | --- |
| `src/Entity/` | Doctrine entities |
| `src/Repository/` | Persistence + query objects |
| `src/Timesheet/` | Timesheet orchestration, rates, rounding, modes |
| `src/Invoice/` | Invoice pipeline |
| `src/Export/` | Export pipeline |
| `src/Security/` + `src/Voter/` | Auth helpers and ACL |
| `src/API/` | REST controllers |
| `src/Controller/` | Web controllers |
| `config/packages/` | Symfony + Kimai + Aariva config |
| `templates/` | Twig views |
| `migrations/` | Schema upgrades |
| `var/plugins/` | Installed plugins (separate repos; out of core scope) |

---

## 8. Architecture notes for this fork

**Strengths**

- Clear service boundaries around timesheets and invoices
- Rich ACL (roles + permission sets + team voters)
- Event-driven plugin / webhook model
- Dual Web + API surface
- Mature schema indexes for reporting

**Complexity hotspots**

- Permission matrix + team ACL voters
- Timesheet validation, lockdown, and rate stacking
- Invoice document pipeline
- Multi-auth providers (internal / LDAP / SAML / tokens)

**Aariva delta**

- Branding: logo + company name in `config/packages/aariva.yaml`
- Local Docker Compose stack and `docker-start.sh`
- No separate domain fork beyond Kimai core at the time of this document

---

## Related files

- `README.md` — upstream Kimai project overview
- `AGENTS.md` — contributor / agent conventions for this repo
- `docker-compose.yml` / `docker-start.sh` — local runtime
- `config/packages/aariva.yaml` — Aariva branding
- `config/packages/security.yaml` — firewalls and access control
- `config/packages/kimai.yaml` — timesheet + permission defaults
