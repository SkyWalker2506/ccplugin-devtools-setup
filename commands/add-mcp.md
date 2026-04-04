---
description: Add optional MCP servers after initial install
allowed-tools: [Bash, Read, Write]
---

# Add MCP — Install Optional MCP Servers

Add MCP servers post-install. Already installed servers are skipped.

## Usage

```
/add-mcp              # List available MCPs, user picks
/add-mcp flutter      # Add flutter-dev MCP
/add-mcp firebase     # Add firebase MCP
/add-mcp unity        # Add Unity MCP (project-level)
/add-mcp flutter,firebase  # Add multiple
```

## Available MCPs

| Key | MCP | Command | Note |
|-----|-----|---------|------|
| `flutter` | flutter-dev | `claude mcp add -s user flutter-dev -- npx -y flutter-dev-mcp` | — |
| `firebase` | firebase | `claude mcp add -s user firebase -e ... -- npx -y @gannonh/firebase-mcp` | Needs `FIREBASE_SERVICE_ACCOUNT_PATH` |
| `unity` | unity-mcp | Project-level install via unity-mcp-cli | Unity Editor must be open |

## Instructions

### 1. Argument check

If argument provided -> install directly. Otherwise -> show list, user picks.

### 2. Already installed?

```bash
claude mcp list 2>/dev/null
```

Skip if already present.

### 3. Prerequisite check

**firebase:** Check `FIREBASE_SERVICE_ACCOUNT_PATH` in `~/.claude/secrets/secrets.env`. If missing, ask for path.

**unity:** Check `unity-mcp-cli` is installed. Verify `$(pwd)` has both `Assets/` and `ProjectSettings/`. If not a Unity project root, tell user to navigate there first.

### 4. Install

Run the appropriate `claude mcp add` command.

### 5. Result

Success: "[mcp-name] MCP added. Active in next session."
Unity: "Unity MCP installed. Open Unity Editor, Tools > MCP Unity > Server Window to start."
Failure: Show error, help troubleshoot.

### Removal

If user says "remove": `claude mcp remove -s user <mcp-name>`

## Arguments

`$ARGUMENTS` may contain: `flutter`, `firebase`, `unity`, or comma-separated list.
