#!/bin/sh
# Keep GitHub credentials out of the cask DSL and installed metadata.
set -eu
ACTION="${1:-install}"
if [ "$#" -gt 0 ]; then shift; fi
case "$ACTION" in
    install|upgrade|fetch) ;;
    *) printf 'Usage: install.sh [install|upgrade|fetch] [Homebrew options]\n' >&2; exit 1 ;;
esac
umask 077
CLAUDEX_CREDENTIAL_HEADERS="$(mktemp /tmp/claudex-brew-headers.XXXXXX)"
trap 'rm -f "$CLAUDEX_CREDENTIAL_HEADERS"' EXIT
trap 'exit 1' HUP INT TERM
CLAUDEX_DOWNLOAD_TOKEN="$(gh auth token --hostname github.com)"
if [ -z "$CLAUDEX_DOWNLOAD_TOKEN" ]; then
    printf 'Sign in to GitHub first: gh auth login --hostname github.com\n' >&2
    exit 1
fi
printf 'Authorization: Bearer %s\n' "$CLAUDEX_DOWNLOAD_TOKEN" > "$CLAUDEX_CREDENTIAL_HEADERS"
unset CLAUDEX_DOWNLOAD_TOKEN
# curl reads the private header file; Homebrew stores only its temporary path.
HOMEBREW_CLAUDEX_HEADERS_FILE="$CLAUDEX_CREDENTIAL_HEADERS" \
    brew "$ACTION" --cask snowell-io/claudex/claudex@alpha "$@"
