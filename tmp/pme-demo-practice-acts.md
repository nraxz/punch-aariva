# PME Demo — Practice Guide (Acts 1–4)

Use this to rehearse alone on the local instance. Sample data is already loaded.

**Base URL:** http://localhost:8001  
**Login page:** http://localhost:8001/en/login  

### Practice passwords (reset for you)

All of these use password: **`Practice1!`**

| Username | Name | Role | Use for |
| --- | --- | --- | --- |
| `emily.carter` | Emily Carter | USER (Transport Officer) | Act 1 — staff capture |
| `daniel.price` | Daniel Price | USER (Transport Analyst) | Optional second officer |
| `sophie.bennett` | Sophie Bennett | TEAMLEAD (Transport Programmes Lead) | Act 2 + Act 3 approvals |
| `claire.morrison` | Claire Morrison | SUPER_ADMIN (Head of Digital & Data) | Act 2 reports / export / Act 4 |
| `james.whitfield` | James Whitfield | ADMIN (Finance BP) | Optional finance view |

Also available: `admin` / password from `.env.docker` (`changeme` by default).

### Your demo cast (already in DB)

**Customer:** West Yorkshire Combined Authority  

**Projects Emily can see (via WYCA Demo – Transport team):**

- `Mass Transit Programme` ← project / PIMS-style  
- `BAU – Transport` ← business-as-usual  

**Shared activities (global):** Project delivery, Governance & reporting, Admin & BAU, Meetings, Training, Stakeholder engagement, …

**Already installed plugins on this instance:** ApprovalBundle, LockdownPerUserBundle  
**Not installed:** Working Hours (flexitime) — treat as slide/talk in Act 3.

---

## Before you start (2 minutes)

1. Open Chrome/Edge (or two windows: one normal, one Incognito) so you can switch users without fighting sessions.
2. Window A → login as `emily.carter`  
3. Window B (Incognito) → login as `sophie.bennett` (keep ready for Act 2/3)  
4. Have a notepad for “say this” lines.

Tip: if a wizard/password screen appears after first login, complete or skip it, then continue.

---

# Act 1 — Capture time (practice ~8–10 min)

**Goal:** Show project + BAU recording, weekly entry, team-limited projects, timer.  
**Persona:** Emily Carter  
**Questionnaire:** 2.1, 2.4, 2.6

### Step 1.1 — Login as staff

1. Go to http://localhost:8001/en/login  
2. Username: `emily.carter`  
3. Password: `Practice1!`  
4. Submit.

**Say:**  
> “In production this would be Microsoft Entra ID single sign-on with MFA. Today we’re on the demo login so we can switch personas quickly.”

### Step 1.2 — Orient on the home screen

1. Land on Dashboard (or open it from the left menu: **Dashboard**).  
2. Point at the left menu: **Time tracking** area — My times, Weekly times (Quick entry), Calendar.

**Say:**  
> “Emily only sees what she’s allowed to. She’s a Transport officer — not a system admin.”

### Step 1.3 — Weekly quick entry (main adoption story)

1. Left menu → **Time tracking** → **Weekly times**  
   Direct URL: http://localhost:8001/en/quick_entry/  
2. Confirm the week shown is the **current week** (change week if needed with the date controls).  
3. Add a row (or use an empty row) and enter:

| Field | Sample value |
| --- | --- |
| Project | `Mass Transit Programme` |
| Activity | `Project delivery` |
| Mon | `2:00` or `02:00` (2 hours) |
| Tue | `3:00` |
| Wed | `1:30` |

4. Save / submit the weekly form (button label is usually **Save**).

**Say:**  
> “Weekly grid — one screen for the whole week. Low admin burden. Same activity list on every project so Finance can compare like with like.”

### Step 1.4 — Book BAU with the same activity

Still on weekly entry (or add another row):

| Field | Sample value |
| --- | --- |
| Project | `BAU – Transport` |
| Activity | `Admin & BAU` (or `Meetings`) |
| Thu | `2:00` |
| Fri | `1:00` |

Save again.

**Say:**  
> “That’s project time and BAU time side by side — question 2.1. Programmes come from the portfolio; BAU is a service-level project per team.”

### Step 1.5 — Prove Teams restrict what she can book (2.6)

1. Still in quick entry or open **My times** → **+** create timesheet  
   URL: http://localhost:8001/en/timesheet/create  
2. Open the **Project** dropdown.  
3. You should see Transport projects (`Mass Transit Programme`, `BAU – Transport`).  
4. You should **not** see e.g. `Skills Bootcamps` or `BAU – Economic Growth` (those belong to other teams).

**Say:**  
> “Users can only record against projects assigned through Teams. Administrators don’t maintain that by hand forever — in delivery we’d sync assignments from PIMS+ and Ci Anywhere.”

### Step 1.6 — Timer / punch style start-stop

1. Go to **My times**: http://localhost:8001/en/timesheet/  
2. Start a running entry:
   - Use the start/timer control if visible in the toolbar, **or**
   - **Create** a timesheet, set Project = `Mass Transit Programme`, Activity = `Meetings`, leave end empty / start running, save.
3. Wait ~10–20 seconds.  
4. **Stop** the running timer from My times.

**Say:**  
> “Timers for people who prefer punch-in/out. Weekly grid for people who fill the week at once. Same underlying timesheet record.”

### Step 1.7 — Confirm entries exist

1. Stay on **My times**.  
2. Filter to this week if needed.  
3. Point at your new Mass Transit + BAU rows.

**Checkpoint — Act 1 done when you can show:**

- [ ] Weekly grid with project hours  
- [ ] BAU hours same week  
- [ ] Project list limited to Transport  
- [ ] One started/stopped timer  

**Logout Emily** (user menu → Logout) before Act 2, or keep Window B for Sophie.

---

# Act 2 — Manager & reporting (practice ~10 min)

**Goal:** Team hours view, user report drill-down, project report + export.  
**Persona:** Sophie Bennett (teamlead), then optionally Claire Morrison (admin)  
**Questionnaire:** 2.8 (partial — core reports only)

### Step 2.1 — Login as Transport lead

1. http://localhost:8001/en/login  
2. Username: `sophie.bennett`  
3. Password: `Practice1!`

**Say:**  
> “Sophie is Transport Programmes Lead — team lead for the Transport demo team. She can see her people’s time.”

### Step 2.2 — Team timesheet list

1. Open **Team times** / admin timesheet if present:  
   http://localhost:8001/en/team/timesheet/  
2. Filter user = `Emily Carter` or show all Transport users.  
3. Point at Emily’s new entries from Act 1.

**Say:**  
> “Line managers see what’s been booked without chasing spreadsheets.”

### Step 2.3 — Reporting home

1. Left menu → **Reporting**  
   URL: http://localhost:8001/en/reporting/  
2. Pause on the list of available reports.

**Say:**  
> “Out of the box: by user, by team of users, by project, by customer. This is what we can show live today. Organisation and directorate dashboards are the reporting layer we add — we’ll come to that in Act 3.”

### Step 2.4 — Weekly users list (team glance)

1. Open **Weekly users list** (or similar title).  
   URL: http://localhost:8001/en/reporting/users/week  
2. Set the week to the week you entered in Act 1.  
3. Find `emily.carter` / Emily Carter in the grid.  
4. Point at daily hours filling in.

**Say:**  
> “Quick view of who has recorded what this week — useful for adoption. It’s not yet a full data-quality dashboard by directorate; that aggregates in the Aariva layer.”

Optional: click **Export** on that report if the button is shown → open the XLSX.

### Step 2.5 — Month by user (project vs BAU story)

1. Open **Month by user**:  
   http://localhost:8001/en/reporting/user/month  
2. Select user **Emily Carter** (if the selector allows; teamlead/admin should).  
3. Select current month.  
4. Expand / read the breakdown: you should see **Mass Transit Programme** and **BAU – Transport** with activities underneath.

**Say:**  
> “Same person, project time and BAU time broken down by activity. That’s the core of project versus BAU reporting.”

### Step 2.6 — Project view + Excel export

Prefer **Claire** for full project reporting rights if Sophie’s permissions are limited:

1. Logout → login `claire.morrison` / `Practice1!`  
2. Open **Project overview / project view**:  
   http://localhost:8001/en/reporting/project_view  
3. Filter customer = **West Yorkshire Combined Authority** if asked.  
4. Point at `Mass Transit Programme` and BAU projects (budgets / time spent if configured).  
5. Use **Export** (XLSX).

**Say:**  
> “Project health and budgets in the product. Finance can take Excel out immediately. For capitalisation packs across directorates, we feed this data into Power BI.”

### Step 2.7 — Global Export (Power BI source story)

1. Left menu → **Export** (under Time tracking)  
   URL: http://localhost:8001/en/export/  
2. Set filters:
   - Customer: West Yorkshire Combined Authority  
   - Date range: this month (or this week)  
   - Users: optional — Emily only, or whole Transport team  
3. Preview if available, then export **Excel** or **CSV**.

**Say:**  
> “Full extract — API and exports are how the reporting layer and other systems consume Kimai. No lock-in.”

**Checkpoint — Act 2 done when you can show:**

- [ ] Reporting menu  
- [ ] Weekly users list with Emily’s hours  
- [ ] Month-by-user with Project + BAU  
- [ ] Project view and/or Export file downloaded  

---

# Act 3 — Honest gaps (practice ~8–10 min)

**Goal:** Show what exists for approvals; clearly narrate what is plugin / Aariva-build.  
**Do not pretend** flexitime Working Hours or Power BI directorate dashboards are native if you don’t have them open.

### Step 3.1 — Week approval (plugin — installed here)

You have **ApprovalBundle** installed.

**As Emily (Window A):**

1. Login `emily.carter` / `Practice1!`  
2. Open Approvals if in menu, or try:  
   http://localhost:8001/en/approval/week_by_user  
3. Select the week you filled.  
4. Submit / **Add to approve** for that week (button labels vary: Submit week / Add to approve).

**As Sophie (Window B):**

1. Login `sophie.bennett` / `Practice1!`  
2. Open **To approve**:  
   http://localhost:8001/en/approval/to_approve  
3. Open Emily’s pending week.  
4. **Approve** (or reject with a comment once, then re-submit and approve — so you know both paths).

**Say:**  
> “Users submit the week; line manager approves or rejects with a comment. Approved periods can be locked against casual edits — Lockdown per user is also in this demo stack.”

If submit/approve UI is confusing on first try: still narrate the flow with the URLs open and move on — don’t burn the room on plugin clicks.

### Step 3.2 — Flexitime (NOT installed — talk track)

**Do this as a 30-second verbal beat** (optionally show a screenshot if you have one):

**Say:**  
> “Flexitime is the Working Hours plugin from Kimai’s store — contracted hours, running balance, flexi leave, monthly lock. We haven’t loaded that plugin in this practice instance. Anything in WYCA’s policy the plugin doesn’t cover, Aariva builds as an add-on. Annual leave and sickness stay in your HR system.”

### Step 3.3 — Matrix PM validation (Aariva build — talk + sketch)

Open a simple slide or whiteboard note:

```
Line manager (Sophie)     → approves the WEEK (people management)
Project / programme mgr   → validates TIME ON THEIR PROJECT (Aariva plugin)
```

**Say:**  
> “Kimai today sends week approval to the team lead. In a matrix organisation we add project-manager validation on top — that’s an Aariva plugin, scoped in discovery, tested in the pilot.”

### Step 3.4 — Directorate / capacity / data-quality (Aariva layer)

1. Briefly re-open Export or `/en/reporting/` — “this is the source”.  
2. Open your mock (spreadsheet or Power BI) **if you have one**. If not, say the report names:

   - Capacity and Demand  
   - Activity Breakdown  
   - Project vs BAU  
   - Finance and Capitalisation  
   - Adoption and Data Quality  

**Say:**  
> “Kimai doesn’t store WYCA’s directorate tree. We combine Kimai actuals with Ci Anywhere hierarchy — typically Power BI — role-based, mostly aggregated.”

### Step 3.5 — Integrations / API (30–45 sec)

1. Open http://localhost:8001/api/doc  
2. Scroll to Users / Projects / Timesheets endpoints.

**Say:**  
> “Documented REST API today. Ci Anywhere and PIMS+ connectors don’t exist off the shelf — Aariva builds scheduled feeds: people, teams, contracted hours, programmes, projects.”

**Checkpoint — Act 3 done when you can:**

- [ ] Attempt or complete an approval happy path **or** narrate it cleanly  
- [ ] Say flexitime = store plugin (not in this practice box)  
- [ ] Say matrix PM validation = Aariva build  
- [ ] Say org dashboards = Aariva reporting layer  
- [ ] Open `/api/doc` once  

---

# Act 4 — Close (practice ~4–5 min)

**Persona:** Stay as Claire (or no screen — stand-up close).  
**Goal:** Timeline, commercial, asks, next step — crisp, no new clicking unless useful.

### Step 4.1 — Delivery timeline (say aloud)

> “Indicatively 4 to 5 months to end of pilot after award:  
> weeks 1–4 discovery and SSO;  
> 5–12 configure, plugins, feeds, reports;  
> 13–15 UAT and train-the-trainer;  
> then pilot 100–120 colleagues, evaluate, roll out in waves with hypercare.”

### Step 4.2 — Commercial one-liner

> “Enterprise model: one flat annual fee, unlimited users — Kimai has no per-user licence, so cost doesn’t rise with headcount growth. Implementation and annual service ranges are in the questionnaire response for budgeting only.”

### Step 4.3 — What you need from WYCA

> “To price and design firmly we need: the flexitime policy, how we can access Ci Anywhere and PIMS+, and whether you standardise on Power BI.”

### Step 4.4 — Offer

> “We’re happy to leave access to this demonstration instance so colleagues can try weekly entry themselves. Happy to come back for a Phase 2 hands-on session.”

### Step 4.5 — Optional final screen

Leave the browser on:

- Dashboard as Claire, **or**  
- Reporting home, **or**  
- `/api/doc`

**Checkpoint — Act 4 done when you can say timeline + fee model + two asks + demo offer without notes.**

---

## Full rehearsal checklist (run once end-to-end)

| # | Action | User | Pass? |
| --- | --- | --- | --- |
| 1 | Login | emily.carter | ☐ |
| 2 | Weekly entry — Mass Transit + Project delivery | emily | ☐ |
| 3 | Weekly entry — BAU Transport | emily | ☐ |
| 4 | Project dropdown limited | emily | ☐ |
| 5 | Start/stop timer | emily | ☐ |
| 6 | Login | sophie.bennett | ☐ |
| 7 | Team times / see Emily | sophie | ☐ |
| 8 | Reporting → users week | sophie/claire | ☐ |
| 9 | Reporting → user month (Emily) | sophie/claire | ☐ |
| 10 | Project view + Export | claire.morrison | ☐ |
| 11 | Approval → Excel/CSV | claire | ☐ |
| 12 | Submit week for approval | emily | ☐ |
| 13 | Approve week | sophie | ☐ |
| 14 | Open /api/doc | claire | ☐ |
| 15 | Speak Act 3 gaps + Act 4 close | — | ☐ |

---

## Sample entries cheat sheet (copy while practicing)

**Emily / this week**

| Project | Activity | Mon | Tue | Wed | Thu | Fri |
| --- | --- | --- | --- | --- | --- | --- |
| Mass Transit Programme | Project delivery | 2:00 | 3:00 | 1:30 | | |
| Mass Transit Programme | Meetings | | | | 1:00 | |
| BAU – Transport | Admin & BAU | | | | 2:00 | 1:00 |
| BAU – Transport | Training | | | 0:30 | | |

Duration format: use whatever the form accepts (`2:00`, `02:00`, or decimal if configured).

---

## If something blocks you

| Problem | Fix |
| --- | --- |
| Login fails | Password was reset to `Practice1!` for the five practice users |
| No Weekly times menu | Open http://localhost:8001/en/quick_entry/ directly |
| Sophie can’t open a report | Switch to `claire.morrison` for that step |
| Approval menu missing | Open `/en/approval/to_approve` and `/en/approval/week_by_user` directly |
| Project not in list for Emily | Use only Mass Transit Programme + BAU – Transport |
| App down | `./docker-start.sh` or `docker compose --env-file .env.docker up -d` |

---

## Timing target when polished

| Act | Clock | Feel |
| --- | --- | --- |
| 1 Capture | 0:00–0:07 | Live clicking |
| 2 Reports | 0:07–0:12 | Live clicking |
| 3 Gaps | 0:12–0:16 | Mix live + talk |
| 4 Close | 0:16–0:20 | Mostly talk |

Practice each act alone first, then run 1→4 without stopping.
