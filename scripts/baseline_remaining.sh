#!/usr/bin/env bash
set -euo pipefail

ROOT="$HOME/.openclaw/workspace-compintel"
LIST_FILE="$ROOT/COMPETITORS.md"

# Read priority lines and loop without mapfile (macOS bash 3.2 compatible)
awk '
  /^## Priority/ {inprio=1; next}
  /^## / && inprio {exit}
  inprio && $0 ~ /^- / {print}
' "$LIST_FILE" | while IFS= read -r line; do
  # Skip DONE for baseline
  if echo "$line" | grep -q "\[DONE\]"; then
    echo "SKIP BASELINE (DONE): $line"
    continue
  fi

  # Strip "- " prefix + trim + remove trailing [DONE] if present
  firm="$(echo "$line" | sed -E 's/^-[[:space:]]+//; s/[[:space:]]+\[DONE\][[:space:]]*$//; s/[[:space:]]+$//')"
  [ -z "$firm" ] && continue

  echo "=== BASELINE: $firm ==="

  openclaw agent --agent compintel -m "
BASELINE RUN for: ${firm}

Read first:
- SOUL.md
- USER.md
- DOSSIER_TEMPLATE.md
- UPDATE_PLAYBOOK.md
- PROMPTS.md
- COMPETITORS.md

Baseline requirements:
- Write/refresh: dossiers/${firm}.md (create if missing)
- Start Snapshot with SEC Form ADV Part 1 Item 5.F RAUM for the correct adviser entity (CRD/SEC# cited)
- Tags:
  - firm-stated metrics => Confidence: high + Tag: self-reported
  - SEC/IAPD/ADV facts => Confidence: high + Tag: independently verifiable
- No speculation; Unknown => 'Unknown / Not confirmed'
- Add a short 'Open questions / To verify' checklist at end

Finish reply with:
1) Updated file path
2) 8–12 bullet WhatsApp summary of what you added (include sources/links)
"
done
