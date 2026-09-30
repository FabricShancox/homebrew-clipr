cask "clipr" do
  version "0.1.2"
  sha256 "3d07a0e2acce95323133b216307636245e9fb7a382b2013d536c44db8bdc4fe3"

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
