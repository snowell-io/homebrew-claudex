cask "claudex@alpha" do
  version "0.1.0,1"
  sha256 "6b3936f090dc13f1019bf1f4c9b846c7c64b6ccfe6caa0df5bbbee878524b844"

  url "https://github.com/snowell-io/claudex-releases/releases/download/v0.1.0-alpha.1/Claudex-0.1.0-alpha.1-arm64.zip"
  name "Claudex Alpha"
  desc "Alpha of the native Claude Code workspace"
  homepage "https://github.com/snowell-io/homebrew-claudex"

  livecheck do
    skip "Alpha releases are published manually"
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Claudex.app"
  binary "#{appdir}/Claudex.app/Contents/MacOS/claudex"

  caveats <<~EOS
    Requires Claude Code installed and signed in with claude auth login.
    Before upgrading, choose Claudex > Stop All Work and Quit.
    Back up ~/Library/Application Support/ClaudexAlpha with the helper stopped.
    Normal Quit leaves background work running.
    Unsigned previews may require Open Anyway in System Settings > Privacy & Security.
  EOS
end
