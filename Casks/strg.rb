cask "strg" do
  version "0.1.1"
  sha256 "bac0f9cccd40f187578844479f94fe199639a219ab5cc9f9e022bf4cfd898746"

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
