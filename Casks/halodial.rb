cask "halodial" do
  version "1.1.0"
  sha256 "43932a8653d78461afb54a181c23c12d70726c1007133834d29d1d1ca07723e5"

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
