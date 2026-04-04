---
description: Run claude-config installer with interactive setup
allowed-tools: [Bash, Read, Glob]
---

# Install — claude-config Setup

Run the claude-config installer. Claude asks the setup questions, then passes answers as flags to `install.sh`.

## Instructions

### 1. Platform and status check

```bash
uname -s
gh auth status 2>&1
ls ~/.claude/secrets/secrets.env 2>/dev/null
```

### 2. Ask the user (skip what is already configured)

**A. Scope:**
> 1. Global (all projects — ~/.claude/ + ~/Projects/)
> 2. Single project (MCP/config for this project only)

- "Global" -> normal install.sh flow (steps B-E)
- "Single project" -> project detection + project-level MCP only (step D, skip install.sh)

**B. Projects root** (global only):
> Default: ~/Projects (macOS) or ~/Documents/GitHub (Windows)

**C. GitHub login** (if `gh auth status` fails):
> Run: `! gh auth login --web -p https`
> If user declines -> `--skip-login`

**D. Project types (stacks):**

Auto-detect from `$(pwd)` and parent directory:
```bash
CUR="$(pwd)"
ls -d "$CUR/Assets" "$CUR/ProjectSettings" 2>/dev/null  # Unity
ls "$CUR/pubspec.yaml" 2>/dev/null                       # Flutter
ls "$CUR/package.json" 2>/dev/null                       # Web
ls "$CUR/requirements.txt" "$CUR/pyproject.toml" 2>/dev/null  # Python
```

Show detection results, ask for confirmation. Options: flutter, unity, web, python, general.
No selection -> `--stacks general`.

**E. Secrets** (if secrets.env missing, global only):
> Private secrets repo URL, or "none".
- URL -> `--secrets-repo URL`
- none -> `--skip-secrets`

### 3. Run install.sh (global scope only)

```bash
cd ~/Projects/claude-config && bash ./install.sh --auto --root <B> --stacks <D> [--skip-login] [--skip-secrets] [--secrets-repo <URL>]
```

Always include `--auto`.

### 4. Result

Show script output. Help with errors if any. On success: "Installation complete."

## Arguments

`$ARGUMENTS` is unused. All parameters are collected interactively.
