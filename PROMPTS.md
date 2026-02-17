# PROMPTS.md — CompIntel Macros (copy/paste)

These are Sammie’s “one-message macros” for consistent competitor intelligence work.
Before executing any macro: read AGENTS.md required reads + DOSSIER_TEMPLATE.md + UPDATE_PLAYBOOK.md.

---

## Global rules (apply to every macro)
- Always read: DOSSIER_TEMPLATE.md, UPDATE_PLAYBOOK.md, and this PROMPTS.md before acting.
- Confidence definition: “Does the cited source explicitly support the claim?”
  - high = explicit
  - medium = indirect/ambiguous
  - low = rumor/hearsay or missing/not retrieved
- Tag rules:
  - Tag: self-reported = firm-claimed metrics/marketing claims (AUM/investment capital/headcount stats, degrees/PhDs counts)
  - Tag: independently verifiable = SEC/IAPD/ADV extracted figures
  - Tag: unconfirmed = plausible but not corroborated
- Dedupe rule:
  - One canonical mention per fact per dossier
  - No meta-bullets repeating the same fact (“captured above”)
  - If cross-reference helps, do it without repeating the key phrase/number
- Foundational build = comprehensive (no bullet caps; subheadings + “Key takeaways” for long sections)
- Daily updates = short/high-signal; WhatsApp digest capped (10–20 bullets total)

---

## Macro 0 — Confirm you’re in the right agent/workspace
Reply with:
- agent id
- workspace path
- primary model
Then list the required reads you will open first for CompIntel work.

---

## Macro 1 — Foundational dossier v1 (full build)
Build `dossiers/{FIRM}.md` using DOSSIER_TEMPLATE.md (foundational run; no bullet caps; dedupe rule applies).

### Do in this order:

1) **Regulatory AUM (must be first)**
   - Identify the correct SEC-registered adviser entity for the firm.
   - Pull latest Form ADV Part 1 (Item 5.F) from SEC/IAPD.
   - Extract and record:
     - Entity name, CRD, SEC #, filing date/time
     - Discretionary RAUM, non-discretionary RAUM, total RAUM, # accounts
     - ADV PDF link + IAPD firm summary link + (optional) API link
   - Write in Snapshot as:
     - exact dollars + (~$X.XB)
   - Confidence: high
   - Tag: independently verifiable
   - Do NOT mix with private fund gross asset values or marketing AUM metrics.
   - IMPORTANT: Do not repeat the RAUM figure anywhere else in the dossier (no “trackpoint” bullets, no repeating RAUM in “Recent updates”). If needed, reference “See Snapshot: Regulatory AUM” WITHOUT repeating the number.



2) **Snapshot**
   - Fill key fields per template.
   - Any firm-stated metric: Confidence high + Tag self-reported.
   - Add rounded numbers for scanability (e.g., $445,958,980,352 (~$446.0B)).

3) **Timeline (notable events)**
   - Start with firm timeline if available, but incorporate strong external sources for major events.
   - Avoid duplicates with Snapshot.

4) **Key personnel**
   - Name — Title — 1–2 line bio — citations
   - Prioritize current leadership + heads of strategies + COO/CRO/CTO/CIO where attributable.

5) **AI / tech offering**
   - Tools/initiatives; data/engineering footprint; notable public statements
   - Keep it attributable; label self-reported claims.

6) **Recent updates (last 12 months)**
   - High-signal moves: leadership changes, office moves, fundraising, performance mentions (credible sources), regulatory actions, new launches/shutdowns
   - Each bullet includes: what changed + why it matters + source metadata

7) **Core + non-core strategies**
8) **Operating model**
9) **Risk management**
10) **Talent strategy**
11) **Investor terms / Employment terms**
    - Only if attributable/permitted; otherwise “Unknown / Not confirmed”.

12) **Dedupe pass**
    - One canonical mention per fact; remove repeats; no meta-bullets repeating key phrase/number.

### Write targets
- Write/overwrite `dossiers/{FIRM}.md` with the completed dossier.

### Reply with
- Adviser entity mapping used (entity, CRD, SEC #)
- RAUM totals (exact + rounded) + filing timestamp
- 15-bullet WhatsApp digest of biggest additions
- 10 open questions + the best sources to answer them

---

## Macro 2 — ADV-only extraction (when RAUM is missing/wrong)
For `dossiers/{FIRM}.md`, complete Regulatory AUM:

- Use SEC/IAPD to locate the latest ADV Part 1 PDF.
- Extract Item 5.F RAUM: discretionary / non-discretionary / total + # accounts + filing timestamp.
- Update Snapshot “Regulatory AUM (Form ADV, Item 5.F)” and remove any “Unknown / Not confirmed” for RAUM.
- Include the ADV PDF link and IAPD firm summary link.
- Confidence: high; Tag: independently verifiable.
- Do not mix entities; if multiple advisers exist, list separately.

Reply with extracted numbers + filing timestamp + entity mapping.

---

## Macro 3 — Dedupe cleanup (when duplicates appear)
In `dossiers/{FIRM}.md`:
- Remove duplicate facts; keep one canonical mention.
- Do not create meta-bullets that repeat the same claim.
- If cross-reference is needed, do it without repeating key phrase/number.

Reply with duplicates removed (max 10) and confirm `grep` of the key phrase would return one match.

---

## Macro 4 — Daily scan update (write + WhatsApp digest)
Run a daily update for firms listed in `COMPETITORS.md`:

- Scan for updates since the last run (or last 24h if unknown).
- Categorize per UPDATE_PLAYBOOK.md.
- Only include attributable, permitted info.

Write targets:
1) Append to each `dossiers/{FIRM}.md` under “Recent updates”
2) Write `updates/YYYY-MM-DD.md` as today’s digest
3) WhatsApp Sammie a 10–20 bullet digest total, grouped by firm

Reply with DONE + list of firms updated.

---

## Macro 5 — Weekly summary (optional)
Summarize the week’s updates from `updates/YYYY-MM-DD.md` files into:
- wins / risks / people moves / strategy shifts / regulatory / AI-tech
- top 10 items with links

Write `updates/WEEKLY-YYYY-WW.md` and send a WhatsApp summary (10–15 bullets).

---

## Macro 6 — Formatting rules (WhatsApp)
- No markdown tables.
- Use bullets.
- Keep it scannable.
- Include links when important.
- If a response is long, start with a 3-bullet “TL;DR”.
