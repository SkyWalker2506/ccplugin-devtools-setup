---
name: devtools-setup
description: "Auto-trigger for setup, install, migration, config, secrets, and MCP management. Activates when user mentions: install, setup, kurulum, migration, bind, config, mcp ekle, add mcp, secrets, admin login, health check, project setup."
version: 1.0.0
---

# DevTools Setup Skill

Unified entry point for claude-config setup and administration tasks. Routes to the appropriate command based on user intent.

## Trigger Phrases

| Intent | Phrases | Routes To |
|--------|---------|-----------|
| Install | install, setup, kurulum, setup config | `/install` |
| Bind | bind, connect config, bagla, baglanti kur | `/bind` |
| Migration | migration, health check, project setup, proje kontrol | `/migration` |
| Add MCP | add mcp, mcp ekle, firebase ekle, flutter ekle, unity ekle | `/add-mcp` |
| Secrets | download secrets, secrets indir, secrets cek, secret login | `/download-secrets` |
| Auth | login, gh auth, github login, admin login, hesap degistir | `/admin-login` |

## Routing Logic

1. Detect user intent from message
2. If intent is clear -> run the matching command directly
3. If ambiguous -> show available commands:
   - `/install` — Run claude-config installer
   - `/bind` — Link CLAUDE.md files to claude-config
   - `/migration` — Project health check and migration
   - `/add-mcp` — Add optional MCP servers
   - `/download-secrets` — Download secrets from private repo
   - `/admin-login` — GitHub auth management

## Dependencies

- `gh` CLI for GitHub operations
- `~/Projects/claude-config/` repo for install and bind
- `~/.claude/secrets/secrets.env` for secrets management

## Signal Handling

This skill also responds to migration hook signals:

| Signal | Action |
|--------|--------|
| `INSTALL_NEEDED` | Run `/install` |
| `MCP_SETUP_NEEDED` | Run `/install` |
| `MIGRATION_NEEDED` | Run `/migration` |
| `MIGRATION_UPDATE` | Run `/migration` with delta apply |
| `SECRETS_MISSING` | Run `/download-secrets` |
| `BIND_NEEDED` | Run `/bind` |
| Status | status check, devtools status, check dependencies, is gh installed | `/status` |
