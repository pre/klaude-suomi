# klaude-suomi

Translates the Claude Code spinner verbs to Finnish. Claude Code shows a
spinner verb, such as "Thinking" or "Pondering", while it works. This
repository contains two verb lists and an installer that adds a list to
any Claude Code profile.

| File        | Content                                                        |
|-------------|----------------------------------------------------------------|
| `suomi.txt` | Finnish verbs in standard language                             |
| `savo.txt`  | Savonian sayings and quips from "Savolaisia sutkauksia ja letkauksia" (Kuopio 1929) |

Each list is a plain text file with one verb per line. Empty lines are
ignored.

## Installation

The installer needs `jq`. Run `./install.sh <file>`. The first argument is
the source verb list. The script builds the `spinnerVerbs` setting from
the list, merges it into the Claude Code `settings.json` file and makes a
backup with the `.bak` suffix. The target is
`$CLAUDE_CONFIG_DIR/settings.json` when the variable is set, otherwise
`~/.claude/settings.json`.

```sh
./install.sh suomi.txt                                  # ~/.claude/settings.json
./install.sh savo.txt                                   # Savonian sayings
CLAUDE_CONFIG_DIR=~/.claude-work ./install.sh suomi.txt # another profile
```

When you change a verb list, run `install.sh` again.
