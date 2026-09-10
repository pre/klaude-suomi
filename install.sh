#!/usr/bin/env bash
# Install the Finnish spinner verbs to the Claude Code settings.
# Usage: ./install.sh [path/settings.json]
# Default: $CLAUDE_CONFIG_DIR/settings.json, or ~/.claude/settings.json
set -euo pipefail

src="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/spinner-verbs.json"
config_dir="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
target="${1:-$config_dir/settings.json}"

if ! jq empty "$src" 2>/dev/null; then
  echo "Error: $src is not valid JSON" >&2
  jq empty "$src" 2>&1 | sed 's/^/  /' >&2 || true
  exit 1
fi
if ! jq -e '.spinnerVerbs.verbs | type == "array" and length > 0 and all(type == "string")' "$src" >/dev/null; then
  echo "Error: $src must contain .spinnerVerbs.verbs as a non-empty array of strings" >&2
  exit 1
fi

mkdir -p "$(dirname "$target")"
[ -f "$target" ] || echo '{}' > "$target"

cp "$target" "$target.bak"
jq -s '.[0] * .[1]' "$target" "$src" > "$target.tmp"
mv "$target.tmp" "$target"

echo "Installed $(jq '.spinnerVerbs.verbs | length' "$src") verbs: $target (backup: $target.bak)"
