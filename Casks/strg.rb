cask "strg" do
  version "0.1.4"
  sha256 "c9bac98ae8fe780017336c37532473245e8f0180be278b5f2abb27093e787bbf"

  url "https://github.com/tobias-istvan/homebrew-strg/releases/download/v#{version}/strg-#{version}-aarch64.zip"
  name "strg"
  desc "Find and reclaim disk space (deletes files; use at your own risk)"
  homepage "https://github.com/tobias-istvan/homebrew-strg"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "strg.app"

  # The app is ad-hoc signed, not notarized: drop the quarantine flag so Gatekeeper doesn't block it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/strg.app"]
  end

  zap trash: [
    "~/Library/Application Support/strg",
    "~/Library/Caches/dev.strg.app",
  ]
end
