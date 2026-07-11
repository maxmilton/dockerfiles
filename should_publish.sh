#!/bin/sh
set -eu

if test -z "$1"; then
  >&2 echo "$0 requires image dir name as argument"
  exit 64
fi

if test -f ".apk-changed-$1"; then
  exit 0
fi

if test -z "${2:-}"; then
  exit 0
fi

if git diff --quiet "$2" -- "$1/"; then
  exit 1
fi

exit 0
