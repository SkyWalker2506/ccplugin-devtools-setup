# ccplugin-devtools-setup

> See global rules: `~/Projects/claude-config/CLAUDE.md`

## Project

Setup, configuration, and admin tools plugin for claude-config.

**Repo:** https://github.com/SkyWalker2506/ccplugin-devtools-setup  
**Version:** 1.1.0

## Commands

| Command | Description |
|---------|-------------|
| `/install` | Run claude-config installer with interactive setup |
| `/bind` | Link CLAUDE.md files to claude-config as redirectors |
| `/migration` | Project health check, version validation, MCP status |
| `/add-mcp` | Add optional MCP servers (Flutter, Firebase, Unity) |
| `/download-secrets` | Download secrets from private GitHub repo |
| `/admin-login` | GitHub authentication and account management |

## Key Files

- `commands/*.md` — 6 command definitions with YAML frontmatter
- `skills/devtools-setup/SKILL.md` — auto-trigger skill with intent routing
- `.claude-plugin/plugin.json` — plugin metadata
- `install.sh` — copies plugin files to ~/.claude/plugins/devtools-setup/

## Dependencies

- `gh` CLI (GitHub CLI) — required for admin-login, download-secrets
- `~/Projects/claude-config/` — required for install, bind
- `~/Projects/MIGRATION_VERSION` — managed by claude-config hooks

## Auto-Trigger

Fires when user mentions: install, setup, migration, bind, config, mcp, secrets, admin login, health check, project setup.
