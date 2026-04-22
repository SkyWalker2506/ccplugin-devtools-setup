# ccplugin-devtools-setup — Master Analysis

**Date:** 2026-04-22  
**Analyst:** Forge/Jarvis  
**Version:** 1.0.0

---

## 1. Project Overview

Setup, configuration, and admin tools plugin for claude-config. The most comprehensive of the three plugins — provides 6 commands: install, bind, migration, add-mcp, download-secrets, admin-login. Has a unified skill with intent-routing and signal handling.

**Stack:** Bash (via command instructions), Markdown command definitions, Claude Code plugin system  
**Dependencies:** `gh` CLI, `~/Projects/claude-config/`, `~/.claude/secrets/secrets.env`

---

## 2. Current State

### Files
| File | Purpose | Quality |
|------|---------|---------|
| `commands/install.md` | `/install` — claude-config installer | Good — interactive, platform-aware, auto-detect stacks |
| `commands/bind.md` | `/bind` — link CLAUDE.md files | Present |
| `commands/migration.md` | `/migration` — health check | Good — phased, 2min timeout, matrix |
| `commands/add-mcp.md` | `/add-mcp` — optional MCPs | Present |
| `commands/download-secrets.md` | `/download-secrets` — secrets from GitHub | Present |
| `commands/admin-login.md` | `/admin-login` — GH auth management | Present |
| `skills/devtools-setup/SKILL.md` | Routing skill | Good — intent routing, signal handling table |
| `.claude-plugin/plugin.json` | Plugin metadata | Present |
| `README.md` | Plugin readme | Very good — install methods, command table, env tweaks, signal handling |
| `LICENSE` | MIT | Present |
| `CLAUDE.md` | Project rules | Present |

### Strengths
- Most mature of the three plugins
- SKILL.md has comprehensive routing + signal handling
- migration.md has a clear phased approach with timeout enforcement
- README has two install methods (bash curl + claude native)
- Commands have YAML frontmatter with `allowed-tools`

### Issues Found
1. **`bind.md`, `add-mcp.md`, `download-secrets.md`, `admin-login.md`** — unread; may be minimal placeholders like clipboard's commands were
2. **No `install.sh`** — unlike ccplugin-clipboard, no automated installer to copy to `~/.claude/plugins/`
3. **Signal handling documented** in SKILL.md but actual hook configuration not in this repo (it's in claude-config)
4. **`plugin.json` `skills` field** — may be missing or incomplete
5. **`migration.md`** references `~/Projects/MIGRATION_VERSION` file — coupling to claude-config internals; brittle if path changes
6. **`install.md`** `--auto` flag passed to `install.sh` — not documented if this flag exists in actual `install.sh`
7. **No `.gitignore`** — `.DS_Store` is untracked
8. **README** mentions "Auto-Trigger" section but only vague — no concrete example of when it fires
9. **Version** is 1.0.0 across all files — no changelog
10. **No smoke test** for verifying the plugin is functional after install

---

## 3. Gap Analysis

| Area | Gap | Priority |
|------|-----|---------|
| Plugin install | No `install.sh` to place plugin in `~/.claude/plugins/` | High |
| Command quality | 4 commands unverified — may be placeholder stubs | High |
| Metadata | `plugin.json` skills field unknown | High |
| Coupling | Hard-coded paths to claude-config internals | Medium |
| Docs | No changelog, no auto-trigger examples | Medium |
| Housekeeping | `.gitignore` missing | Low |

---

## 4. Recommended Sprint Structure

### Sprint 1 — Audit & Foundation
- Read all 4 unverified command files (bind, add-mcp, download-secrets, admin-login)
- Audit `plugin.json` — add `skills` field if missing
- Add `.gitignore`

### Sprint 2 — Enhancement
- Add `install.sh` to deploy plugin to `~/.claude/plugins/devtools-setup/`
- Flesh out any stub command files found in Sprint 1
- Add auto-trigger example to README

### Sprint 3 — Polish
- Bump version to `1.1.0` across `plugin.json` and `SKILL.md`
- Add CHANGELOG section to README
- Validate migration.md paths are accurate with current claude-config
