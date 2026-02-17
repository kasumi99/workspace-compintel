# RUNBOOK

## Start a new firm dossier
1) touch dossiers/{FIRM}.md
2) WhatsApp: paste Macro 1 from PROMPTS.md and set {FIRM}
3) Verify:
   - grep "Form ADV" dossiers/{FIRM}.md | head
   - grep "reports.adviserinfo.sec.gov/reports/ADV" dossiers/{FIRM}.md | head
4) If RAUM missing: WhatsApp Macro 2
5) If duplicates: WhatsApp Macro 3
