cask "clipr" do
  version "0.1.1"
  sha256 "6916a899e97e02af42a425b0d096c39e698a2ae1eb7f5cfde2f4a63f8fa534b6"

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
