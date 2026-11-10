# Claudex private alpha

This private Homebrew tap distributes Claudex.app and the bundled `claudex` CLI.
Access is granted through this repository; testers do not need access to the
application's source repository. Download details and checksums are on the
[Releases page](https://github.com/snowell-io/homebrew-claudex/releases).

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
sh "$(brew --repository snowell-io/claudex)/install.sh"
open -a Claudex
```

The small `install.sh` wrapper runs `brew install --cask` with credentials from
GitHub CLI. It writes a private temporary HTTP header file and deletes it when
the command exits. The cask uses the GitHub release asset API to authenticate its
download; Homebrew stores the temporary file path instead of the token in its
metadata. Do not add a token to the tap, shell history, screenshots, or bug reports.
For unattended use, a fine-grained GitHub token needs only Contents: Read access
to this distribution repository, with organization approval if required.

Homebrew may request trust for this private cask. Trust only
`snowell-io/claudex/claudex@alpha` if prompted.

## First launch of the unsigned alpha

The initial alpha is ad-hoc signed for executable integrity, without a Developer
ID certificate or Apple notarization. If macOS blocks the first launch, attempt
to open Claudex, then go to **System Settings → Privacy & Security → Open Anyway**
and confirm opening the app. See [Apple's instructions](https://support.apple.com/en-us/102445).
The installer preserves quarantine; it does not disable Gatekeeper or remove
security attributes. Permission may be required again after updating an ad-hoc
signed build. Microphone and speech permissions may also need to be granted again.

## Update

Before replacing the app, choose **Claudex → Stop All Work and Quit**.
Ordinary Quit leaves the helper and accepted work running. With the helper
stopped, back up `~/Library/Application Support/ClaudexAlpha` (or your configured
`CLAUDEX_ALPHA_DATA_DIR`). Keep the previous installer and its matching data
backup for rollback.

```sh
brew update
sh "$(brew --repository snowell-io/claudex)/install.sh" upgrade
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

The publication script requires Developer ID signing and notarization by default.
This closed alpha uses its explicit `--allow-unsigned` mode. Installation and
first-launch approval on a separate clean Mac remain validation steps.

Known issue: the UI test for the bottom of a long workspace-folder list fails
by 9 points on the current macOS/Xcode version. The Release build succeeds;
the full test run had one failure and 15 skipped tests out of 382 tests.
