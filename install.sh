#!/bin/sh
# Compatibility wrapper; direct brew installation is supported.
set -eu
ACTION="${1:-install}"
if [ "$#" -gt 0 ]; then shift; fi
case "$ACTION" in
    install|upgrade|fetch) ;;
    *) printf 'Usage: install.sh [install|upgrade|fetch] [Homebrew options]\n' >&2; exit 1 ;;
esac
exec brew "$ACTION" --cask snowell-io/claudex/claudex@alpha "$@"
