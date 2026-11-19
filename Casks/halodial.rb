cask "halodial" do
  version "1.0.3"
  sha256 "95311117f459195b25a72c99df5b0ec7d2210f831b8b1f81b05ee81c7ac9e26c"

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
