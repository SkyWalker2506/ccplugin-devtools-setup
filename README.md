# devtools-setup — Claude Code Plugin

by [Musab Kara](https://linkedin.com/in/musab-kara-85580612a) · [GitHub](https://github.com/SkyWalker2506)

Setup, configuration, and admin tools for claude-config. Handles installation, CLAUDE.md binding, project migration, MCP server management, secrets download, and GitHub auth.

## Install

```bash
claude plugin install devtools-setup@musabkara-claude-marketplace
```

## Commands

| Command | Description |
|---------|-------------|
| `/install` | Run claude-config installer with interactive setup |
| `/bind` | Link CLAUDE.md files to claude-config as redirectors |
| `/migration` | Project health check, version validation, MCP status |
| `/add-mcp` | Add optional MCP servers (Flutter, Firebase, Unity) |
| `/download-secrets` | Download secrets from private GitHub repo |
| `/admin-login` | GitHub authentication and account management |

## Environment Tweaks

The installer sets these automatically via `install.sh`:

| Variable | Effect |
|----------|--------|
| `CLAUDE_CODE_NO_FLICKER=1` | Fixes terminal flickering, enables mouse support. Experimental renderer — smoother UI as chat grows. Trade-off: no Cmd+F, different copy-paste behavior |

## Auto-Trigger

The `devtools-setup` skill activates when you mention: install, setup, migration, bind, config, mcp, secrets, or admin login. It routes to the correct command automatically.

## Signal Handling

Responds to migration hook signals (`INSTALL_NEEDED`, `MIGRATION_NEEDED`, `SECRETS_MISSING`, etc.) and runs the appropriate command.

## Requirements

- `gh` CLI installed
- `~/Projects/claude-config/` repo cloned
- `~/.claude/secrets/secrets.env` for secrets operations

## Part of

- [claude-config](https://github.com/SkyWalker2506/claude-config) — Multi-Agent OS for Claude Code (134 agents, local-first routing)
- [Plugin Marketplace](https://github.com/SkyWalker2506/claude-marketplace) — Browse & install all 14 plugins
