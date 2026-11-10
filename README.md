# Claudex private alpha

This private Homebrew tap distributes Claudex.app and the bundled `claudex` CLI.
Access is granted through this repository; testers do not need access to the
application's source repository. No binary is available until the first
prerelease appears on the [Releases page](https://github.com/snowell-io/homebrew-claudex/releases).

## Install

Requirements: Homebrew 7 or later, macOS 13 or later, and the architecture listed
in the release notes. The first build targets Apple Silicon. Install and sign in
to Claude Code separately (`claude auth login`). GitHub CLI is used to authenticate
downloads; its account must have read access to this repository.

```sh
brew install gh
gh auth login --hostname github.com
gh auth setup-git --hostname github.com
brew tap snowell-io/claudex https://github.com/snowell-io/homebrew-claudex.git
HOMEBREW_CLAUDEX_GITHUB_TOKEN="$(gh auth token --hostname github.com)" \
  brew install --cask snowell-io/claudex/claudex@alpha
open -a Claudex
```

The token is supplied to Homebrew for this command only. The cask uses the
GitHub release asset API to authenticate its download. Homebrew 7 defers this
token until download time instead of storing its value in cask metadata.
Do not add a token to the tap, shell history, screenshots, or bug reports.
For unattended use, a fine-grained GitHub token needs only Contents: Read access
to this distribution repository, with organization approval if required.

Homebrew may request trust for this private cask. Trust only
`snowell-io/claudex/claudex@alpha` if prompted.

## Update

Before replacing the app, choose **Claudex → Stop All Work and Quit**.
Ordinary Quit leaves the helper and accepted work running. With the helper
stopped, back up `~/Library/Application Support/ClaudexAlpha` (or your configured
`CLAUDEX_ALPHA_DATA_DIR`). Keep the previous installer and its matching data
backup for rollback.

```sh
brew update
HOMEBREW_CLAUDEX_GITHUB_TOKEN="$(gh auth token --hostname github.com)" \
  brew upgrade --cask snowell-io/claudex/claudex@alpha
```

Reopen the app and check history, drafts, settings and a disposable task before
resuming work. Updates never transfer running processes between app versions.

## Uninstall

Stop all work first, then run:

```sh
brew uninstall --cask snowell-io/claudex/claudex@alpha
```

Uninstall preserves application data and worktrees. This tap deliberately has no
`zap` action that could delete conversation history or unsent attachments.

Only Developer ID signed, Apple notarized archives are accepted by the
publication script. Installation on a separate clean Mac remains a release
validation step.
