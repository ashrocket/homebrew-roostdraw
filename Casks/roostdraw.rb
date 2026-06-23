cask "roostdraw" do
  version "1.0.0"
  # shasum -a 256 dist/RoostDraw-<version>.dmg  (of the NOTARIZED dmg uploaded to the release)
  sha256 "31b5b7281b2dcb185ce74af62cf9930dc351fe0f296fa2dc2439fbfe611bb161"

  url "https://github.com/ashrocket/roost-draw/releases/download/v#{version}/RoostDraw-#{version}.dmg"
  name "RoostDraw"
  desc "MacPaint-style editor for the Roost scratchpad"
  homepage "https://github.com/ashrocket/roost-draw"

  depends_on macos: :sequoia # macOS 15 or newer

  app "RoostDraw.app"

  zap trash: [
    "~/Library/Preferences/art.roostsocial.RoostDraw.plist",
  ]
end

# Tap + install:
#   brew tap ashrocket/roostdraw https://github.com/ashrocket/homebrew-roostdraw
#   brew install --cask roostdraw
#
# Notarization is what lets this cask pass Gatekeeper offline: brew downloads the
# dmg (quarantined), and because the notarization ticket is stapled, validation
# succeeds without a network round-trip or a right-click->Open.
