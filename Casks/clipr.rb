cask "clipr" do
  version "0.1.3"
  sha256 "40a546270d7924e063e30b4bb174a5afca99a04b20ca40893e8c47ab68342a48"

  url "https://github.com/FabricShancox/Clipr/releases/download/v#{version}/Clipr-#{version}.zip"
  name "Clipr"
  desc "Screenshot capture and annotation tool"
  homepage "https://github.com/FabricShancox/Clipr"

  depends_on macos: :sonoma

  app "Clipr.app"

  # Clipr isn't notarized, so Gatekeeper would block it on first launch; clearing the
  # quarantine flag lets it open normally.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Clipr.app"], must_succeed: false
  end

  zap trash: "~/Library/Preferences/com.shancox.clipr.plist"
end
