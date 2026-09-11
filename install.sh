#!/usr/bin/env bash
# Install a spinner verb list to the Claude Code settings.
# Usage: ./install.sh <verbs.txt>   (one verb per line)
# Target: $CLAUDE_CONFIG_DIR/settings.json, or ~/.claude/settings.json
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <verbs.txt>" >&2
  echo "Example: $0 suomi.txt" >&2
  exit 2
fi

src="$1"
config_dir="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
target="$config_dir/settings.json"

if [ ! -f "$src" ]; then
  echo "Error: $src does not exist" >&2
  exit 1
fi

verbs="$(jq -R -s '{spinnerVerbs: {mode: "replace", verbs: (split("\n") | map(select(length > 0)))}}' "$src")"
count="$(jq '.spinnerVerbs.verbs | length' <<<"$verbs")"
if [ "$count" -eq 0 ]; then
  echo "Error: $src has no verbs (one verb per line)" >&2
  exit 1
fi

mkdir -p "$(dirname "$target")"
[ -f "$target" ] || echo '{}' > "$target"

cp "$target" "$target.bak"
jq --argjson verbs "$verbs" '. * $verbs' "$target" > "$target.tmp"
mv "$target.tmp" "$target"

echo "Installed $count verbs from $src: $target (backup: $target.bak)"
