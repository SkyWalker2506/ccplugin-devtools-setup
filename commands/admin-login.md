---
description: GitHub authentication and account management
allowed-tools: [Bash, Read, Edit]
---

# Admin Login — GitHub Auth Management

Login, switch accounts, or check GitHub auth status.

## Instructions

### 1. Check current auth

```bash
gh auth status 2>&1
```

- Already logged in -> "GitHub: logged in as [USER]." -> stop.
- Not logged in -> proceed to step 2.

### 2. Email check

```bash
grep "^GITHUB_EMAIL=" ~/.claude/secrets/secrets.env 2>/dev/null
```

- Found -> show: "Registered email: X"
- Not found -> ask user for GitHub email, save to secrets.env as `GITHUB_EMAIL=<value>`

### 3. Login

Tell user to run:
```
! gh auth login --web -p https
```

After login completes:
```bash
gh auth setup-git
gh api user -q '.login'
```

### 4. Multi-account (if requested)

```bash
gh auth switch --user <USER>
git remote set-url origin https://<USER>@github.com/<USER>/repo.git
```

## Rules

- If already logged in, do nothing
- `gh auth login` is interactive — user runs with `!`
- Only save email, never print tokens or secrets

## Arguments

`$ARGUMENTS` may contain a username for account switching.
