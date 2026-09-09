#!/usr/bin/env bash
# Install the Finnish spinner verbs to the Claude Code settings.
# Usage: ./install.sh [path/settings.json]
# Default: $CLAUDE_CONFIG_DIR/settings.json, or ~/.claude/settings.json
set -euo pipefail

src="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/spinner-verbs.json"
config_dir="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
target="${1:-$config_dir/settings.json}"

mkdir -p "$(dirname "$target")"
[ -f "$target" ] || echo '{}' > "$target"

cp "$target" "$target.bak"
jq -s '.[0] * .[1]' "$target" "$src" > "$target.tmp"
mv "$target.tmp" "$target"

echo "Installed $(jq '.spinnerVerbs.verbs | length' "$src") verbs: $target (backup: $target.bak)"
