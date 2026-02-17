# OPS_NOTES — CompIntel Workflow (Mac mini)

## 0) Purpose
- Maintain competitor dossiers from permitted, attributable sources.
- Produce daily/weekly digests.
- Hand off outputs to work via email for validation + consumption.

## 1) Folder structure (workspace-compintel)
- `AGENTS.md` — operating rules (required reads, dedupe, tags, outputs)
- `SOUL.md` — behavioral defaults (includes CompIntel default mode)
- `PROMPTS.md` — copy/paste macros (Macro 0–6)
- `DOSSIER_TEMPLATE.md` — dossier format + provenance rules
- `UPDATE_PLAYBOOK.md` — daily update categories + output format + run state
- `COMPETITORS.md` — firm list + priority order
- `dossiers/` — per-firm dossiers (`{FIRM}.md`)
- `updates/` — daily digests (`YYYY-MM-DD.md`)
- `memory/` — daily logs + run state (`compintel-state.json`)
- `sources/` — optional: downloaded PDFs / reference docs

## 2) One-time setup steps (Mac mini)
1) Install Homebrew (if needed) and confirm:
   - `brew --version`
2) Install any tools needed for export (optional):
   - `brew install pandoc`
3) OpenClaw onboarding:
   - Connect WhatsApp channel
   - Confirm Web UI reachable
4) Create compintel workspace and folders:
   - `dossiers/`, `updates/`, `memory/`, `sources/`
5) Create and fill core files:
   - AGENTS.md, SOUL.md, PROMPTS.md, DOSSIER_TEMPLATE.md, UPDATE_PLAYBOOK.md, COMPETITORS.md
6) Create run state:
   - `memory/compintel-state.json`

## 3) Common errors + fixes
### Homebrew / PATH
- Symptom: brew not found
- Fix: ensure brew shellenv in zshrc:
  - `echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc`
  - `eval "$(/opt/homebrew/bin/brew shellenv)"`

### JSON config invalid
- Symptom: OpenClaw says config invalid / unknown keys
- Fix:
  - Validate JSON: `python3 -m json.tool ~/.openclaw/openclaw.json`
  - Remove unsupported keys (use doctor if suggested)

### WhatsApp connected but no response
- Check channel is Connected/Running in UI
- Confirm DM policy / allowFrom is correct (allowlist)
- Use “Note to self” to message

### Dossier duplicates (same fact repeated)
- Fix: run Macro 3 (dedupe cleanup)
- Verify: `grep` key figure should return one line

### RAUM missing
- Fix: run Macro 2 (ADV-only extraction)

## 4) Daily operating procedure
### A) Build new firm dossier (foundational)
1) `touch dossiers/{FIRM}.md`
2) WhatsApp: Macro 1 with {FIRM} replaced
3) Verify:
   - `grep -n "Form ADV" dossiers/{FIRM}.md | head`
4) If RAUM missing → Macro 2
5) If duplicates → Macro 3

### B) Daily scan updates
1) WhatsApp: Macro 4
2) Outputs:
   - appends to dossiers under “Recent updates”
   - writes `updates/YYYY-MM-DD.md`
   - sends WhatsApp digest

### C) Weekly summary (optional)
- WhatsApp: Macro 5

## 5) Email handoff procedure (to work)
### A) Send a full dossier for validation
- Export Markdown to PDF (preferred) OR attach .md
- Include: “public sources only” + request feedback on structure + compliance concerns

### B) Send daily incremental updates
- Attach `updates/YYYY-MM-DD.md` or PDF export
- Keep email body short (top items + links)

## 6) Do / Don’t (compliance + sourcing)
### Do
- Use attributable sources (publisher + date + URL)
- Use tags:
  - `self-reported` for firm-claimed metrics
  - `independently verifiable` for SEC/IAPD/ADV
- Use confidence correctly (high = explicit support)
- Mark unknown as “Unknown / Not confirmed”

### Don’t
- Don’t include leaked/NDA/MNPI material
- Don’t speculate
- Don’t repeat key facts across sections (dedupe)

## 7) Improvement backlog
- [ ] Standardize dossier filenames (canonical short names vs full names)
- [ ] Add run-state usage to daily scan to prevent repetitive updates
- [ ] Add export script for batch PDF creation
