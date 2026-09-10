# klaude-suomi

Translates the Claude Code spinner verbs to Finnish. Claude Code shows a
spinner verb, such as "Thinking" or "Pondering", while it works. This
repository contains a Finnish verb list and an installer that adds the list
to any Claude Code profile.

## Installation

The installer needs `jq`. Run `./install.sh`. The script merges the file
`spinner-verbs.json` into the Claude Code `settings.json` file and makes a
backup with the `.bak` suffix. The target is `$CLAUDE_CONFIG_DIR/settings.json`
when the variable is set, otherwise `~/.claude/settings.json`. A path given
as an argument overrides both.

```sh
./install.sh                                    # ~/.claude/settings.json
CLAUDE_CONFIG_DIR=~/.claude-work ./install.sh   # another profile
./install.sh /path/settings.json                # any other target
```

When you add a verb to `spinner-verbs.json`, run `install.sh` again. The
script checks that the file is valid JSON before it changes the target.
