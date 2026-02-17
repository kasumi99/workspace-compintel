# UPDATE_PLAYBOOK

## Goal
Maintain competitor dossiers and produce foundational dossiers + daily/weekly digests.

## Source policy (Permitted + Attributable)
Include information if:
- it is attributable (source + date + reference), AND
- we are permitted to use it (public, licensed/paywalled we have rights to, or internal/authorized).

Do NOT include leaked/stolen/NDA-breaching material or anything that appears to be MNPI.
If something is rumor/hearsay, label it clearly and set confidence low.

## Update categories
- Firm overview changes (AUM, offices, headcount)
- People moves (joins/departures/promotions)
- Geographic expansion
- Acquisitions / partnerships
- New fund launches / fund shutdowns
- Fundraising
- Performance mentions (credible sources only)
- Regulatory (Form ADV changes, enforcement, filings)
- Capital allocation / strategy shifts
- Operating model / committees
- Risk management disclosures
- AI/tech initiatives

## Confidence + tags (important)
### Confidence definition
Confidence measures: "Does the cited source clearly support this statement?"

Set:
- Confidence: high  → the source explicitly states it (direct support)
- Confidence: medium → source is indirect/ambiguous, partial support, or interpretation required
- Confidence: low → rumor/hearsay OR missing source OR source not yet retrieved

### Tags (required when relevant)
Add a short tag after confidence when applicable:
- Tag: self-reported → metric/claim comes from the firm itself (AUM/investment capital/headcount stats, marketing claims)
- Tag: independently verifiable → widely corroborated across credible external sources
- Tag: unconfirmed → plausible but not yet corroborated sufficiently

Rule of thumb:
- If the firm website states "we have $X AUM", then Confidence is HIGH (they said it), Tag is SELF-REPORTED.
- Do not downgrade to medium just because it's self-reported; use the tag.

## Output format
Every update bullet must include:
- date (event date; if unknown use "as of" date)
- category
- what changed (1–2 lines)
- why it matters (1 line)
- source + date + reference
- confidence (high/medium/low) + optional tag

## Output size rules
### Foundational build (first dossier pass)
Goal: be comprehensive and well-attributed.
- No hard bullet limit.
- Prefer completeness + structure.
- Avoid duplicates and filler.
- If a section gets long, add subheadings and a short “Key takeaways” at the top of that section.

## Deduping rule
- One canonical mention per fact per dossier.
- Do NOT create meta-bullets that restate the same fact (“captured above”).
- If cross-referencing is helpful, add a short inline note without repeating the key phrase/number.


### Daily update runs
Goal: high signal, low noise.
- WhatsApp digest: 10–20 bullets max TOTAL, grouped by firm.
- File updates can be longer, but keep each firm’s “Recent updates” tight and scannable.

## Write targets
Each run must:
1) Append to `dossiers/{FIRM}.md` under “Recent updates”
2) Write `updates/YYYY-MM-DD.md` as today’s digest
3) Send Sammie a WhatsApp digest (10–20 bullets max), grouped by firm

## Run state
Record last run timestamps in `memory/compintel-state.json` to avoid duplicate reporting.
Update `lastDailyRun` after each daily scan and `lastWeeklyRun` after each weekly summary.
