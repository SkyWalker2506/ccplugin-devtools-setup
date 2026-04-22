---
description: Run a comprehensive environment diagnostic for claude-config. More thorough than /status.
allowed-tools: [Bash, Read, ToolSearch]
---

# /doctor

Run a comprehensive environment diagnostic for claude-config and all devtools-setup dependencies.

## Instructions

### Phase 1 — Core Prerequisites (15s)

```bash
# gh CLI
gh auth status 2>&1
gh --version 2>/dev/null

# claude-config
ls ~/Projects/claude-config/install.sh 2>/dev/null
cat ~/Projects/claude-config/version 2>/dev/null || echo "no version file"

# Secrets
ls ~/.claude/secrets/secrets.env 2>/dev/null
grep -c "=" ~/.claude/secrets/secrets.env 2>/dev/null || echo "0 keys"

# Migration version
cat ~/Projects/MIGRATION_VERSION 2>/dev/null || echo "not set"
cat .claude/migration_version 2>/dev/null || echo "not set (project)"
```

### Phase 2 — MCP Health (20s)

Use ToolSearch to verify key MCP tools are available:
- Check for: github, atlassian, git, context7

### Phase 3 — Claude Config Status (10s)

```bash
# Agent registry sync
cd ~/Projects/claude-config && python3 scripts/sync_agents.py --check 2>/dev/null || echo "sync_agents.py not available"

# Install.sh flags (verify --auto is supported)
grep -q "auto" ~/Projects/claude-config/install.sh && echo "--auto: supported" || echo "--auto: NOT supported"
```

### Phase 4 — Summary Report

Output a structured report:

```
╔══════════════════════════════════════╗
║     devtools-setup Doctor Report     ║
╚══════════════════════════════════════╝

Core Prerequisites
─────────────────
✅ gh CLI: logged in as SkyWalker2506
✅ claude-config: found (version 42)
✅ secrets.env: found (18 keys)
✅ migration version: master=42, project=42

MCP Health
──────────
✅ github: available
✅ atlassian: available
✅ git: available
⚠️  context7: not found

Agent Registry
──────────────
✅ sync_agents.py: in sync

Issues: 1 warning(s), 0 error(s)
```

**CRITICAL:** Complete within 2 minutes. Report partial results on timeout.
