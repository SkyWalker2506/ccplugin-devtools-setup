---
description: Project health check and migration — version check, MCP health, file validation
allowed-tools: [Bash, Read, Write, Edit, Glob, Grep, ToolSearch]
---

# Migration — Project Setup & Health Check

Validate project setup, detect issues, fix or report within 2 minutes.

## Usage

```
/migration              # Full setup + health check
/migration health       # Health check only (no file creation)
/migration setup        # Setup only (wizard from scratch)
/migration fix          # Auto-fix detected issues
```

## Instructions

### Phase 0 — Environment Detection (5s)

```bash
MASTER=$(cat ~/Projects/MIGRATION_VERSION 2>/dev/null | tr -d '[:space:]')
PROJECT=$(cat .claude/migration_version 2>/dev/null | tr -d '[:space:]')
```

Detect project type: package.json (Node), pubspec.yaml (Flutter), Cargo.toml (Rust), go.mod (Go), pyproject.toml (Python).

### Phase 1 — MCP Health Check (30s)

For each MCP, use ToolSearch to verify tools are available:
- atlassian, github, git, firebase, context7, jcodemunch

Check for config conflicts across `~/.claude/settings.json`, `.claude/settings.json`, `~/.claude/mcp.json`.

### Phase 2 — File Health Check (15s)

| File | Check | If Missing |
|------|-------|------------|
| `CLAUDE.md` | Exists, not empty | Create from template |
| `.claude/settings.json` | Has `enabledMcpjsonServers` | Create from template |
| `.claude/migration_version` | Matches master | Setup wizard or apply delta |
| `.gitignore` | Exists, includes `.env` | Create for framework |
| `.env.example` | If Jira/Firebase used | Create template |

### Phase 3 — Decision Matrix

Each issue classified as: `auto_fix`, `user_action`, or `skip`.

### Phase 4 — Report

Output structured report with: version status, MCP status table, file status table, user actions needed, auto-fixes applied.

**CRITICAL:** This command must complete within 2 minutes. On timeout, report current state and stop.

## Arguments

`$ARGUMENTS` may be: `health`, `setup`, or `fix`. Default: full check.

## Path Dependencies

This command reads from `~/Projects/MIGRATION_VERSION` (master version) and `.claude/migration_version` (project version). These files are managed by `~/Projects/claude-config/`. If the path differs on your system, check `~/Projects/claude-config/scripts/` for the migration hook scripts.

## Timeout

**CRITICAL:** This command must complete within 2 minutes. On timeout, report current state and stop.
