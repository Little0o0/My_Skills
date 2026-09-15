#!/usr/bin/env bash
# Install the immediate, non-hidden subdirectories containing SKILL.md.
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: ./install.sh [--link] [--dry-run] [--help]

  --link       Link skills to this checkout instead of copying them.
  --dry-run    Show the installation plan without writing any files.
  --help       Show this help.

Destination: $CODEX_SKILLS_DIR, or ${CODEX_HOME:-$HOME/.codex}/skills.
Existing entries are moved to a unique directory under <destination>.backups
before replacement. Backups stay outside the installed skills directory.

Examples:
  ./install.sh --dry-run
  ./install.sh --link
  CODEX_SKILLS_DIR="$HOME/.agents/skills" ./install.sh
EOF
}

fail() { printf 'Error: %s\n' "$*" >&2; exit 1; }

# Resolve directory symlinks and dot components without creating missing paths.
canonical_dir() {
  local remaining="$1" resolved="/" component
  case "$remaining" in /*) ;; *) remaining="$PWD/$remaining" ;; esac
  while [ -n "$remaining" ]; do
    component="${remaining%%/*}"
    case "$remaining" in */*) remaining="${remaining#*/}" ;; *) remaining="" ;; esac
    case "$component" in
      ''|.) continue ;;
      ..) resolved="${resolved%/*}"; resolved="${resolved:-/}"; continue ;;
    esac
    resolved="${resolved%/}/$component"
    if [ -d "$resolved" ]; then
      resolved="$(cd -P "$resolved" && pwd -P)" || return 1
    elif [ -e "$resolved" ] || [ -L "$resolved" ]; then
      printf 'Error: not a directory: %s\n' "$resolved" >&2
      return 1
    fi
  done
  printf '%s\n' "$resolved"
}

# True when either directory contains the other, including equality.
overlap() {
  case "$1/" in "$2/"*) return 0 ;; esac
  case "$2/" in "$1/"*) return 0 ;; esac
  return 1
}

MODE="copy"
DRY_RUN=0
for arg in "$@"; do
  case "$arg" in
    --link) MODE="link" ;;
    --dry-run) DRY_RUN=1 ;;
    -h|--help) usage; exit 0 ;;
    *) printf 'Unknown option: %s\n' "$arg" >&2; usage >&2; exit 2 ;;
  esac
done

SRC="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
DEST="$(canonical_dir "${CODEX_SKILLS_DIR:-${CODEX_HOME:-$HOME/.codex}/skills}")"
if overlap "$SRC" "$DEST"; then
  fail "source and destination must not contain each other: $SRC ; $DEST"
fi

skills=()
for dir in "$SRC"/*; do
  [ -d "$dir" ] && [ -f "$dir/SKILL.md" ] || continue
  real_source="$(canonical_dir "$dir")"
  if overlap "$real_source" "$DEST"; then
    fail "a source skill overlaps the destination: $dir ; $DEST"
  fi
  skills[${#skills[@]}]="$dir"
done

printf 'Source:      %s\nDestination: %s\nMode:        %s' "$SRC" "$DEST" "$MODE"
[ "$DRY_RUN" -eq 0 ] || printf ' (dry-run)'
printf '\n'
if [ "${#skills[@]}" -eq 0 ]; then
  printf 'No skills found.\n'
  exit 0
fi

BACKUP_ROOT="$(canonical_dir "${DEST}.backups")"
if overlap "$BACKUP_ROOT" "$DEST" || overlap "$BACKUP_ROOT" "$SRC"; then
  fail "backup directory overlaps the source or destination: $BACKUP_ROOT"
fi
BACKUP_DIR=""
[ "$DRY_RUN" -eq 1 ] || mkdir -p "$DEST"
for dir in "${skills[@]}"; do
  name="${dir##*/}"
  target="$DEST/$name"
  printf '  %s\n' "$name"
  if [ -e "$target" ] || [ -L "$target" ]; then
    if [ "$DRY_RUN" -eq 1 ]; then
      printf '    Would back up existing entry under %s\n' "$BACKUP_ROOT"
    else
      if [ -z "$BACKUP_DIR" ]; then
        mkdir -p "$BACKUP_ROOT"
        BACKUP_DIR="$(mktemp -d "$BACKUP_ROOT/$(date +%Y%m%d-%H%M%S).XXXXXX")"
      fi
      mv "$target" "$BACKUP_DIR/$name"
    fi
  fi
  [ "$DRY_RUN" -eq 0 ] || continue
  if [ "$MODE" = "link" ]; then
    ln -s "$dir" "$target"
  else
    mkdir "$target"
    cp -R "$dir/." "$target/"
    find "$target" -type f -name '.DS_Store' -delete
  fi
done

if [ "$DRY_RUN" -eq 1 ]; then
  printf 'Would install %s skill(s) into %s.\n' "${#skills[@]}" "$DEST"
else
  printf 'Installed %s skill(s) into %s.\n' "${#skills[@]}" "$DEST"
  [ -z "$BACKUP_DIR" ] || printf 'Previous entries: %s\n' "$BACKUP_DIR"
fi
