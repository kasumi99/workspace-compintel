# Workflow — Home Incrementals → Work Master Dataset

## Goal
Use home runs for incremental monitoring, while keeping the canonical dataset synchronized to GitHub so work environment always has latest dossiers/updates/compendiums.

## Source of truth
- **GitHub repo (`main`) is canonical transfer layer** between home and work.
- Home runs can create/update files locally, but a run is not "complete" until pushed.

---

## Daily Operating Steps (Home)

1) **Pull latest first**
```bash
git checkout main
git pull --rebase origin main
```

2) **Run incremental scan(s)**
- Update dossiers under `dossiers/`
- Update daily digest under `updates/YYYY-MM-DD.md`
- Update compendiums if needed under `compendiums/YYYY-MM-DD/`

3) **Run quick QA**
- Confirm each non-trivial claim has source/date/reference/confidence/tag
- Confirm dedupe (no duplicate bullets)
- Confirm recency ordering for `Recent updates (rolling)` is newest → oldest

4) **Commit in logical chunks**
```bash
git add dossiers/... updates/... compendiums/... COMPENDIUM_TEMPLATE.md PROMPTS.md COMPETITORS.md scripts/...
git commit -m "<clear summary>"
```

5) **Push to GitHub (required)**
```bash
git push origin main
```

6) **Verify remote**
- Open GitHub `main` and confirm file paths + commit hash are visible.

---

## Daily Operating Steps (Work)

1) Pull latest:
```bash
git checkout main
git pull --rebase origin main
```

2) Continue from pulled state:
- Build work-side compendium packages or downstream decks
- Add work-only attributable updates and commit/push back

---

## Compendium cadence (recommended)
- Weekly: generate `compendiums/YYYY-MM-DD/{FIRM}.md`
- Use `COMPENDIUM_TEMPLATE.md` as fixed structure
- Keep focus to deltas since last compendium checkpoint

---

## Checkpointing (important)
- `memory/compendium-state.json` stores per-firm checkpoint metadata (`last_compendium_at`, `last_compendium_file`).
- If `memory/` is gitignored, keep a mirrored tracked state file if you want cross-machine checkpoint persistence (e.g., `state/compendium-state.json`).

---

## GitHub checklist before ending a run
- [ ] New/changed dossiers committed
- [ ] Daily update file committed
- [ ] Compendium files committed (if produced)
- [ ] Template changes committed (if changed)
- [ ] `git status` clean (or only intentional local-only files)
- [ ] `git push origin main` completed
- [ ] Remote branch shows new commits
