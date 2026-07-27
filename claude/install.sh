#!/usr/bin/env bash
#
# install.sh — install every Claude Code skill in this folder into ~/.claude/skills/
#
# Usage:
#   ./install.sh                 # install into ~/.claude/skills (or $CLAUDE_SKILLS_DIR)
#   ./install.sh --link          # symlink instead of copy (edits here take effect live)
#   ./install.sh --dry-run       # show what would happen, change nothing
#   CLAUDE_SKILLS_DIR=/path ./install.sh   # override the destination
#
# A "skill" is any immediate subdirectory that contains a SKILL.md file.
# Existing skills of the same name are replaced.

set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

MODE="copy"
DRY_RUN=0
for arg in "$@"; do
  case "$arg" in
    --link) MODE="link" ;;
    --dry-run) DRY_RUN=1 ;;
    -h|--help) grep '^#' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "Unknown option: $arg" >&2; exit 2 ;;
  esac
done

echo "Source:      $SRC"
echo "Destination: $DEST"
echo "Mode:        $MODE$([ "$DRY_RUN" = 1 ] && echo ' (dry-run)')"
echo

[ "$DRY_RUN" = 1 ] || mkdir -p "$DEST"

count=0
for dir in "$SRC"/*/; do
  name="$(basename "$dir")"
  [ -f "$dir/SKILL.md" ] || continue   # only real skills, skip stray folders
  echo "  $name"
  if [ "$DRY_RUN" = 1 ]; then count=$((count+1)); continue; fi
  rm -rf "$DEST/$name"
  if [ "$MODE" = "link" ]; then
    ln -s "${dir%/}" "$DEST/$name"
  else
    cp -R "${dir%/}" "$DEST/$name"
    find "$DEST/$name" -name '.DS_Store' -delete 2>/dev/null || true
  fi
  count=$((count+1))
done

echo
echo "Installed $count skill(s) into $DEST."
echo "Open Claude Code and run /skills to confirm they are loaded."
