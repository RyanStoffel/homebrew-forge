cask "forge" do
  version "0.1.0-edge.2de6606"

  on_arm do
    sha256 "04fbf64ddf224156da2a788821325762d37060d62da0044f8339f5232fa0ca66"
    url "https://github.com/RyanStoffel/forge/releases/download/edge/Forge-aarch64-apple-darwin.zip"
  end
  on_intel do
    sha256 "d2c0a35f95baca20046082210760c2c9ab68420d299b905361f05d9b530e12b2"
    url "https://github.com/RyanStoffel/forge/releases/download/edge/Forge-x86_64-apple-darwin.zip"
  end

  name "Forge"
  desc "Native terminal, editor, Git, and coding-agent workspace"
  homepage "https://github.com/RyanStoffel/forge"

  app "Forge.app"
  binary "#{appdir}/Forge.app/Contents/MacOS/forge"

  caveats <<~EOS
    Forge is an unsigned edge build. On first launch, macOS may require
    System Settings → Privacy & Security → Open Anyway.
  EOS

  zap trash: [
    "~/Library/Application Support/Forge",
    "~/Library/Preferences/dev.ryanstoffel.forge.plist",
    "~/Library/Saved Application State/dev.ryanstoffel.forge.savedState",
  ]
end
