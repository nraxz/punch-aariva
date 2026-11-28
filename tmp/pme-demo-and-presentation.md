# WYCA PME — Demo & Presentation Guide

Source questionnaire: `tmp/Appendix 2 - PME Questionnaire - Aariva response.pdf`  
Interactive pack: Cursor canvas `pme-demo-prep.canvas.tsx`

Audience: West Yorkshire Combined Authority (WYCA) Phase 2 / demonstration session.  
Product story: **Kimai core** (hosted as Aariva Punch) + **store plugins** + **Aariva-built** gaps.

---

## How reporting works today (inside Kimai)

### Entry & permissions

- UI: `/{locale}/reporting` (e.g. `/en/reporting`)
- Gate: `view_reporting`
- Registry: `App\Reporting\ReportingService`
- Plugins can add more reports via `ReportingEvent`

Permission slices:

| Permission | Reports |
| --- | --- |
| `report:user` | Week / Month / Year **by one user** |
| `report:other` | Weekly / Monthly / Yearly **users list** |
| `report:project` | Project details, project view, date range, inactive projects |
| `report:customer` | Customer monthly projects |

### Data path

```
Filter form (user, dates, project…)
    → Reporting controller
    → TimesheetStatisticService / ProjectStatisticService
    → Doctrine aggregates on kimai2_timesheet
    → Twig table
    → optional XLSX (HTML → PhpSpreadsheet)
```

User reports roll up: **Customer → Project → Activity → daily stats** (duration, rate, internal rate).

### Related (not under Reporting menu)

- **Export** — filtered timesheets to Excel / CSV / PDF; mark exported
- **Invoices** — billable timesheets → finance documents
- **Dashboard / Calendar** — personal and team glance views
- **Custom Reports plugin** — proposed in the bid; not in this core checkout

### What core reporting cannot do (matches Q 2.8–2.11)

- Directorate / org hierarchy dashboards
- Capacity vs demand
- Historical org structure when people move teams
- Org-wide completion / data-quality dashboard

These are the **Aariva reporting layer / Power BI** items in the questionnaire.

---

## Three-layer model (own this in every answer)

1. **Kimai core (free OSS)** — timesheets, projects/activities, teams, roles, SSO, API, standard reports/exports, period concepts
2. **Kimai store plugins (~€550/yr)** — Working Hours (flexi), Audit Trail, Custom Fields, Custom Reports; free: Approval, Lockdown per user, Importer
3. **Aariva builds** — matrix PM validation; Ci Anywhere + PIMS+ feeds; directorate/capacity/finance/DQ reporting layer; any flexi rules the plugin misses

---

## Slide outline (~25–30 min with Q&A)

### Part A — Who & why (5 min)

1. Aariva intro; honest on no public-sector time-recording reference yet  
2. Why Kimai: mature OSS, no per-user licence, UK data ownership, no lock-in  
3. Three-layer diagram  
4. We use it ourselves: punch.aariva.co.uk  

### Part B — Live product (12 min)

5. Record project + BAU time  
6. Teams restrict assigned projects  
7. Weekly quick entry + timer  
8. Core reports + Excel export  
9. REST API / SSO architecture glance  

### Part C — Gaps & roadmap (5 min)

10. Flexitime (Working Hours plugin)  
11. Matrix PM validation (Aariva)  
12. Directorate / capacity / DQ dashboards (Aariva layer)  
13. Ci Anywhere + PIMS+ feeds  

### Part D — Delivery & commercial (5 min)

14. 4–5 month path to end of pilot  
15. Flat enterprise fee; indicative £ ranges from Q7.1  
16. Ask WYCA for flexi policy + system access options  
17. Offer demo instance access  

---

## Live demo script (~20 min)

### Prep checklist

- [ ] Seed WYCA-style customers / projects / BAU / activities / teams / personas  
- [ ] Optional: install Working Hours + Approval if you will show them live  
- [ ] One mock Capacity / Project-vs-BAU / Capitalisation dashboard (Power BI or spreadsheet)  
- [ ] Confirm `/api/doc` works  
- [ ] Rehearse the honest “what we build” segment  

### Seed data mapping

| Kimai | WYCA meaning | Examples |
| --- | --- | --- |
| Customer | Directorate or programme owner | Transport, Housing, Corporate |
| Project (active) | PIMS+ project | Mass Transit Outline, Bus Franchising |
| Project (BAU) | Service BAU | Transport BAU, Finance BAU |
| Activity (shared) | Agreed categories | Project delivery, Governance, Admin, Training |
| Team | Line team / visibility | Transport Delivery, Finance MI |
| Users | Personas | Officer, Team Lead, PM, Finance, Admin |
| Tag / custom field | Finance flag | capitalisable yes/no |

### Act 1 — Capture (2–7 min) — Q 2.1, 2.4, 2.6

1. Login as team member — “Production uses Entra ID SSO; today local login.”  
2. Open weekly quick entry — low admin burden.  
3. Book time to a project **and** a BAU project with the **same activity list**.  
4. Show project picker is limited by Teams.  
5. Start a timer briefly — punch/timer option.  

### Act 2 — Manager / reports (7–12 min) — Q 2.8 partial

1. Switch to teamlead/admin.  
2. Reporting → Weekly users list — team hours glance (not full DQ dashboard).  
3. Month by user — expand project/activity — project vs BAU via naming.  
4. Project view + XLSX export — budgets / spent.  
5. Export menu — CSV/Excel as source for Power BI.  

### Act 3 — Honest gaps (12–16 min)

| Gap | Bid answer | Demo tactic |
| --- | --- | --- |
| Flexitime | Working Hours plugin | Live plugin or screenshot |
| Week approval | Approval + Lockdown | Describe submit → approve → lock |
| PM matrix validation | Aariva plugin | Wireframe slide |
| Directorate / capacity / DQ | Aariva reporting layer | Mock dashboard |
| Ci Anywhere / PIMS+ | Aariva scheduled feeds | `/api/doc` + sync sketch |

### Act 4 — Close (16–20 min)

- Timeline: discovery → config → pilot 100–120 → waves + hypercare  
- Commercial: unlimited users, flat fee; ranges as in questionnaire  
- Ask: flexitime policy; Ci Anywhere / PIMS+ access method  
- Offer hands-on demo instance  

---

## Capability vs questionnaire (cheat sheet)

| Theme | Q | Status | Demo? |
| --- | --- | --- | --- |
| Project + BAU | 2.1 | Core | Yes |
| Flexitime | 2.2–2.3 | Plugin | If installed |
| Adoption UX | 2.4 | Mostly core | Yes |
| Approvals | 2.5 | Plugin | Explain / partial |
| Assigned projects | 2.6 | Core (Teams) | Yes |
| Matrix PM approval | 2.7 | Aariva build | Talk only |
| Org/directorate reports | 2.8–2.11 | Aariva layer | Mock |
| Integrations | 3.1–3.2 | API yes; feeds later | API doc |
| Security / UK host | 5.x | Architecture | Slide |

---

## Inside-out application (one paragraph each)

**Capture** — `TimesheetService` + tracking modes (default / punch / duration) validate, round, rate, fire events, persist to `kimai2_timesheet`. Weekly quick entry and calendar write the same entity.

**Control** — Role hierarchy + permission sets + Team voters. Period locking / week approval / flexi balances / audit trail come from **plugins**, not this core tree.

**Consume** — Built-in reports, Export, Invoices, REST API. Org-level Capacity, Finance capitalisation packs, and DQ dashboards are **outside** core: Aariva reporting layer on exports/API/MySQL (e.g. Power BI).

**Identity** — Form login today; production story is SAML/Entra ID + MFA. LDAP also supported.

**Integrations** — Full REST API exists; Ci Anywhere and PIMS+ connectors do **not** — Aariva builds scheduled feeds in implementation.

---

## Suggested talking lines

- “We are not a time-recording vendor. We propose a proven open-source product we run ourselves, hosted and extended in the UK by Aariva.”  
- “Anything we add is a Kimai plugin or a separate reporting service so the core stays upgradeable.”  
- “Standard reports cover user, team, project and activity. Directorate and capacity views need your hierarchy from Ci Anywhere — that is the reporting layer we build.”  
- “No per-user licence: cost does not scale with your 10% headcount growth.”  

---

## Contacts (from questionnaire)

- Naresh Shahi, Director — naresh@aariva.co.uk  
- Ram Adhikari, Head of Technology — ram@aariva.co.uk  
