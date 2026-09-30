cask "clipr" do
  version "0.1.0"
  sha256 "08d65b431288403bbf078afecc393e9334303c7aa1bec3747bea17a11c93b5de"

  url "https://github.com/FabricShancox/Clipr/releases/download/v#{version}/Clipr-#{version}.zip"
  name "Clipr"
  desc "Screenshot capture and annotation tool"
  homepage "https://github.com/FabricShancox/Clipr"

  depends_on macos: ">= :sonoma"

  app "Clipr.app"

  # Clipr isn't notarized, so Gatekeeper would block it on first launch; clearing the
  # quarantine flag lets it open normally.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Clipr.app"]
  end

  zap trash: "~/Library/Preferences/com.shancox.clipr.plist"
end
