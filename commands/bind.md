---
description: Link CLAUDE.md files to claude-config as redirectors
allowed-tools: [Bash, Read, Edit, Write]
---

# Bind — claude-config Connection Setup

Convert `~/.claude/CLAUDE.md` (global) and `~/Projects/CLAUDE.md` (projects) into redirectors that point to `~/Projects/claude-config/CLAUDE.md`.

## Instructions

### 1. Status check

Check these files:

| File | Check |
|------|-------|
| `~/.claude/CLAUDE.md` | Exists? Contains "claude-config/CLAUDE.md"? |
| `~/Projects/CLAUDE.md` | Exists? Contains "claude-config/CLAUDE.md"? |
| `~/Projects/claude-config/CLAUDE.md` | Exists? (master file) |

- Both already bound -> "Connection already active. No action needed." -> stop.
- One missing -> report which, proceed to step 2.
- Neither bound -> report both, proceed to step 2.

### 2. Confirmation

Ask user:
> Set up claude-config binding? This will:
> - Convert [unbound files] to redirectors
> - All rules will be read from ~/Projects/claude-config/CLAUDE.md

### 3. Content analysis

For each unbound file:
1. Read its content
2. Compare with ~/Projects/claude-config/CLAUDE.md
3. Report what exists, what is already covered, what needs migration

### 4. Content migration

Move any unique content into `~/Projects/claude-config/CLAUDE.md` in the appropriate section.

### 5. Write redirectors

**Global** (`~/.claude/CLAUDE.md`): Redirector pointing to claude-config.
**Projects** (`~/Projects/CLAUDE.md`): Redirector pointing to claude-config.

Then run `install.sh` to deploy.

### 6. Verification

Read both files, confirm they are redirectors. Report success.

## Arguments

`$ARGUMENTS` is unused.
