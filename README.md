# klaude-suomi

**Give Claude Code a Finnish state of mind.**

While Claude works, let it brew coffee, heat the sauna, or ponder things in
Savonian. `klaude-suomi` replaces the English phrases in Claude Code's loading
spinner with Finnish verbs or Savonian sayings. A little piece of Finland in
your terminal, one waiting moment at a time.

## A little Savo while you wait

Give Claude a Savonian voice, with sayings from *Savolaisia sutkauksia ja
letkauksia* (Kuopio, 1929):

```text
✻ Suattaahan tuota tulla…
✻ Totta huokastahhii pittää…
✻ Kyllä sinun kans kulluu aeka hupasesti…
✻ Nykyaeja viisaus ja se tekniikkana tässä pelloo…
```

Roughly: “Something might come of it”, “One does need a breather”, “Time sure
flies with you”, and “That's modern wisdom and technology at work”. Nearly a
century later, these lines feel right at home while an AI works on your code.

Prefer coffee and sauna to Savonian commentary? The Finnish list has you covered:

```text
✻ Vispataan…
✻ Keitellään kahvia…
✻ Lämmitetään saunaa…
✻ Etsitään punaista lankaa…
```

Choose a list, run the installer, and enjoy the next pause. This customizes
the spinner text; Claude's responses and the rest of its interface keep their
existing language.

## Pick your Finnish

| List | What you'll see |
| --- | --- |
| [savo.txt](savo.txt) | Savonian sayings and quips from the 1929 collection. For a terminal with a little more character. |
| [suomi.txt](suomi.txt) | Finnish verbs and playful phrases, from `Pohditaan` (pondering) to `Heitetään löylyä` (throwing water on the sauna stones). |
| [lohja.txt](lohja.txt) | Lohja dialect from Western Uusimaa — southwestern forms with opened diphthongs and d→r. |

## Get started

You'll need Claude Code with support for the `spinnerVerbs` setting, plus
Git, Bash, and `jq`.

```sh
git clone https://github.com/pre/klaude-suomi.git
cd klaude-suomi
./install.sh savo.txt
```

Start a new Claude Code session and let the Savonian commentary begin.

For Finnish verbs, run this from the same directory:

```sh
./install.sh suomi.txt
```

Each install replaces the current spinner list, so switching back is just
`./install.sh savo.txt` away.

## What gets changed?

The installer reads your chosen list and writes it to the `spinnerVerbs`
setting in `~/.claude/settings.json`, using `mode: "replace"` to replace the
built-in English phrases. Other settings are preserved.

Before writing, it copies the settings file to `settings.json.bak` in the
same directory. Each install overwrites that backup with the settings from
immediately before the install.

If you keep a separate Claude Code profile, select it with `CLAUDE_CONFIG_DIR`:

```sh
CLAUDE_CONFIG_DIR=~/.claude-work ./install.sh suomi.txt
```

This updates `~/.claude-work/settings.json`. Use the same profile when
starting Claude Code.

To return to Claude Code's built-in phrases, remove the `spinnerVerbs` entry
from that profile's `settings.json` and start a new session. If you had a custom
list before installing, you can recover it from `settings.json.bak`, provided
it hasn't been overwritten by another install.

## Make it your own

Each list is a UTF-8 text file with one phrase per line. Blank lines are
ignored. Add your favorite expression to a list and run the installer again,
or create a list of your own:

```sh
printf '%s\n' 'Keitellään kahvia' 'Heitetään löylyä' 'Ratkotaan' > omat.txt
./install.sh omat.txt
```

Leave off the trailing `…`; Claude Code adds it for you. Have a phrase that
belongs in everyone's terminal? Add it to a list and open a pull request.

## License

[MIT](LICENSE).
