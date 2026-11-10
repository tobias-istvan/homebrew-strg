cask "strg" do
  version "0.1.0"
  sha256 "2278bdb2ba298dbaf2a9da95b042741b68ab71069e5d68eed9c2c55045ac37e4"

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
