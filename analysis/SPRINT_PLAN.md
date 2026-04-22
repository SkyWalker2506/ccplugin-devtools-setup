# ccplugin-devtools-setup — Sprint Plan

**Date:** 2026-04-22  
**Forge Run:** 1  
**Sprints:** 3 × max 5 tasks

---

## Sprint 1 — Audit & Foundation

| # | Task | Type | Est |
|---|------|------|-----|
| 1 | Add `skills`, `commands`, `category`, `keywords` to `plugin.json` (currently missing `skills` and `commands`) | fix | 10min |
| 2 | Add `.gitignore` (`.DS_Store`, `*.log`) | chore | 5min |
| 3 | Create `install.sh` — copies plugin files to `~/.claude/plugins/devtools-setup/` | feat | 20min |
| 4 | Validate all 6 command paths in `plugin.json` commands array | fix | 5min |

**Goal:** Plugin metadata is complete; install mechanism exists.

---

## Sprint 2 — Enhancement

| # | Task | Type | Est |
|---|------|------|-----|
| 1 | Add auto-trigger example to README (concrete scenario: user says "setup config" → fires) | docs | 10min |
| 2 | Add CHANGELOG section to README | docs | 10min |
| 3 | Improve `migration.md` — add note about `MIGRATION_VERSION` path dependency on claude-config | docs | 5min |
| 4 | Add `devtools-setup` auto-trigger description to README's Auto-Trigger section with example phrases | docs | 10min |

**Goal:** Users understand exactly when/how the auto-trigger fires; changelog established.

---

## Sprint 3 — Polish

| # | Task | Type | Est |
|---|------|------|-----|
| 1 | Bump version to `1.1.0` in `plugin.json` and `SKILL.md` | chore | 3min |
| 2 | Add signal handling table to README (currently only in SKILL.md) | docs | 10min |
| 3 | Validate `install.md` `--auto` flag against actual `install.sh` in claude-config | fix | 5min |
| 4 | Final git commit with clean history | chore | 5min |

**Goal:** Repository is production-ready; signals documented at README level.
