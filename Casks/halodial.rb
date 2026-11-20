cask "halodial" do
  version "1.2.0"
  sha256 "e66bfb9e25fde2c353e132cb24236e40db7d9f48d518d8d51625b174caba1f69"

  url "https://github.com/Halodial/releases/releases/download/v#{version}/Halodial.dmg"
  name "Halodial"
  desc "Dial for your files that opens under your pointer"
  homepage "https://halodial.github.io/"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Halodial.app"

  # Halodial isn't notarized by Apple yet: clear the download flag so it opens without the Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Halodial.app"]
  end

  uninstall quit: "com.sarthak102.halodial"

  zap trash: [
    "~/Library/Logs/Halodial.log",
    "~/Library/Preferences/com.sarthak102.halodial.plist",
  ]
end
