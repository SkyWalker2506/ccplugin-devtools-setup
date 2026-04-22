#!/bin/bash
set -euo pipefail

PLUGIN_NAME="devtools-setup"
INSTALL_DIR="$HOME/.claude/plugins/$PLUGIN_NAME"

echo "🔧 ccplugin-devtools-setup install starting..."

# Check prerequisites
if ! command -v gh &>/dev/null; then
  echo "⚠️  WARNING: gh CLI not found. Some commands require it."
  echo "   Install: https://cli.github.com/"
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Create install dirs
mkdir -p "$INSTALL_DIR/commands" "$INSTALL_DIR/.claude-plugin" "$INSTALL_DIR/skills/devtools-setup"

if [ "$SCRIPT_DIR" != "$INSTALL_DIR" ]; then
  cp "$SCRIPT_DIR/commands/"*.md "$INSTALL_DIR/commands/"
  cp "$SCRIPT_DIR/.claude-plugin/plugin.json" "$INSTALL_DIR/.claude-plugin/"
  [ -f "$SCRIPT_DIR/skills/devtools-setup/SKILL.md" ] && \
    cp "$SCRIPT_DIR/skills/devtools-setup/SKILL.md" "$INSTALL_DIR/skills/devtools-setup/"
fi

echo ""
echo "✅ ccplugin-devtools-setup v1.2.0 installed at $INSTALL_DIR"
echo "Commands: /install, /bind, /migration, /add-mcp, /download-secrets, /admin-login, /status, /doctor"
echo ""
echo "Run /doctor for a comprehensive environment diagnostic."
