# Homebrew cask for Fumble. Update `version` and `sha256` on each release; the URL points at
# the DMG attached to the GitHub release.
# Install: `brew install --cask alexiscodingbits/fumble/fumble`.
cask "fumble" do
  version "1.0.0"
  sha256 "ccd80ec1dd6b5644f38da4f1ba94d49a67a147d0e04e291663176aa49f008fe1"

  url "https://github.com/alexiscodingbits/Fumble/releases/download/v#{version}/Fumble-#{version}.dmg"
  name "Fumble"
  desc "Typing coach that learns your weak keys from how you really type"
  homepage "https://github.com/alexiscodingbits/Fumble"

  depends_on macos: ">= :sonoma"

  app "Fumble.app"

  # Input Monitoring must be granted manually; it cannot be scripted.
  caveats <<~EOS
    Fumble needs Input Monitoring permission to measure your typing:
      System Settings → Privacy & Security → Input Monitoring → enable Fumble

    Click the menu-bar keyboard icon → Grant access on first launch.
  EOS

  uninstall quit: "com.alexiscodingbits.fumble"

  zap trash: [
    "~/Library/Application Support/Fumble",
    "~/Library/Preferences/com.alexiscodingbits.fumble.plist",
  ]
end
