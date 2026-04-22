---
description: Quick status check for devtools-setup dependencies — gh CLI, claude-config, secrets.
allowed-tools: [Bash, Read]
---

# /status

Check that all devtools-setup dependencies are present and working.

## Instructions

Run the following checks and report results:

### 1. gh CLI

```bash
gh auth status 2>&1
```
- Logged in → ✅
- Not logged in → ❌ "Run /admin-login to authenticate"

### 2. claude-config repo

```bash
ls ~/Projects/claude-config/install.sh 2>/dev/null && echo "found" || echo "missing"
```
- Found → ✅
- Missing → ❌ "Run: git clone https://github.com/SkyWalker2506/claude-config ~/Projects/claude-config"

### 3. Secrets

```bash
ls ~/.claude/secrets/secrets.env 2>/dev/null && echo "found" || echo "missing"
```
- Found → ✅
- Missing → ⚠️ "Run /download-secrets to fetch from GitHub"

### 4. Migration version

```bash
cat ~/Projects/MIGRATION_VERSION 2>/dev/null || echo "not set"
```
- Present → ✅ show version
- Missing → ⚠️ "Run /migration to initialize"

### 5. Summary

Print a summary table:

```
Component         Status
─────────────────────────
gh CLI            ✅ logged in as SkyWalker2506
claude-config     ✅ found
secrets.env       ✅ found
migration version ✅ v42
```
