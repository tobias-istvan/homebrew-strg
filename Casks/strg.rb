cask "strg" do
  version "0.1.2"
  sha256 "1802825d1d68241b7f89f0652fd84392c021b674be294317c083262441511229"

  url "https://github.com/tobias-istvan/homebrew-strg/releases/download/v#{version}/strg-#{version}-aarch64.zip"
  name "strg"
  desc "Find and reclaim disk space on your Mac (deletes files; use at your own risk)"
  homepage "https://github.com/tobias-istvan/homebrew-strg"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "strg.app"

  # The app is ad-hoc signed, not notarized: drop the quarantine flag so Gatekeeper doesn't block it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/strg.app"]
  end

  zap trash: [
    "~/Library/Application Support/strg",
    "~/Library/Caches/dev.strg.app",
  ]
end
