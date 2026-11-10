# Claudex Alpha — Homebrew

Install the macOS alpha with one command:

```sh
brew install --cask snowell-io/claudex/claudex@alpha
```

No GitHub account, token, or invitation is required. Homebrew adds this public
tap automatically. The initial release requires Apple Silicon (M1 or newer),
macOS 13 or newer, and an installed, signed-in Claude Code (`claude auth login`).

Then launch the app:

```sh
open -a Claudex
```

The initial alpha has no Developer ID certificate or Apple notarization. If
macOS blocks the first launch, attempt to open Claudex, then go to
**System Settings → Privacy & Security → Open Anyway** and confirm opening it.
[Apple's instructions](https://support.apple.com/en-us/102445).
Approval and microphone permissions may be requested again after updates.

## Update

Choose **Claudex → Stop All Work and Quit** first. Ordinary Quit leaves the
background helper and accepted work running. With the helper stopped, back up
`~/Library/Application Support/ClaudexAlpha` (or `CLAUDEX_ALPHA_DATA_DIR`).
Keep the previous app and its matching data backup for rollback.

```sh
brew update
brew upgrade --cask snowell-io/claudex/claudex@alpha
```

## Uninstall

Stop all work first, then run:

```sh
brew uninstall --cask snowell-io/claudex/claudex@alpha
```

Application data and worktrees are preserved. This tap has no destructive `zap`
action. The old `install.sh` command remains as a compatibility wrapper and no
longer uses GitHub credentials.

[Direct ZIP downloads and installation instructions](https://github.com/snowell-io/claudex-releases).
