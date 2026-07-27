# Claude Code Skills

My personal collection of [Claude Code](https://claude.com/claude-code) skills. Each
subfolder is one skill (a directory containing a `SKILL.md`). Claude Code loads skills
from `~/.claude/skills/`, so installing means copying these folders there.

## Skills

| Skill | What it does |
| --- | --- |
| `research-paper-writing` | Improve ML/CV/NLP paper writing: section structure, paragraph flow, claim–evidence alignment, adversarial self-review, and a human-voice (anti-AI-style) prose guide. |

## Install on a new machine

```bash
git clone git@github.com:Little0o0/My_Skills.git
cd My_Skills/claude
./install.sh
```

`install.sh` copies every folder here that contains a `SKILL.md` into
`~/.claude/skills/`, replacing any existing skill of the same name. Then open Claude Code
and run `/skills` to confirm they are loaded.

### Options

```bash
./install.sh --dry-run   # list what would be installed, change nothing
./install.sh --link      # symlink instead of copy, so edits in this repo apply live
CLAUDE_SKILLS_DIR=/custom/path ./install.sh   # install somewhere other than ~/.claude/skills
```

### Manual install (no script)

```bash
mkdir -p ~/.claude/skills
cp -R research-paper-writing ~/.claude/skills/
```

Project-scoped instead of global: copy into a project's `.claude/skills/` rather than
`~/.claude/skills/`.

## Add a new skill to this collection

1. Drop the skill folder (with its `SKILL.md`) into this directory.
2. Add a row to the table above.
3. Commit and push.

`install.sh` picks it up automatically on the next run, so the steps above are all that
is needed to make it installable on any other machine.
