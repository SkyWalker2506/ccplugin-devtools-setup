---
description: Download secrets from private GitHub repo
allowed-tools: [Bash, Read]
---

# Download Secrets

Clone or pull the private secrets repo to `~/.claude/secrets/`.

## Instructions

### 1. GitHub login check

```bash
gh auth status
```

- Logged in -> proceed to step 2
- Not logged in -> tell user: `! gh auth login --web -p https`

### 2. Secrets repo check

```bash
SECRETS_DIR="$HOME/.claude/secrets"
```

**A) Repo exists -> pull:**
```bash
cd ~/.claude/secrets && git pull
```

**B) No repo -> clone:**
```bash
GH_USER=$(gh api user -q .login)
git clone "https://github.com/$GH_USER/claude-secrets.git" ~/.claude/secrets
```

If clone fails, ask user for the private repo URL.

### 3. Verification

```bash
ls -la ~/.claude/secrets/secrets.env
```

Check for required keys:
```bash
grep "^GITHUB_TOKEN=" ~/.claude/secrets/secrets.env
```

### 4. Apply (optional)

Ask user if they want to run `install.sh` to apply the updated secrets.

## Rules

- `gh auth login` is interactive — user must run with `!`
- NEVER print secret values to terminal

## Arguments

`$ARGUMENTS` is unused.
