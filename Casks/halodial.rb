cask "halodial" do
  version "1.0.1"
  sha256 "cc8d9688721adc07b0ba1489d42967836a8ac9324f2e56ea4989c5cd948afb9e"

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
