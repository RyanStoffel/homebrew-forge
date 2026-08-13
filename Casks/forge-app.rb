cask "forge-app" do
  version "0.1.0-edge.b8b5267"

  on_arm do
    sha256 "e0d1d779cdd05b9c5ffca39877b7269263073cab8f5115615eabfc6daf3e3bf9"
    url "https://github.com/RyanStoffel/forge/releases/download/forge-app-#{version}/Forge-aarch64-apple-darwin.zip"
  end
  on_intel do
    sha256 "bd5c44afa2c83c235adbbb96e0b7a76bfbcf9f1eada379768907f8e4ed83944d"
    url "https://github.com/RyanStoffel/forge/releases/download/forge-app-#{version}/Forge-x86_64-apple-darwin.zip"
  end

  name "Forge"
  desc "Native terminal, editor, Git, and coding-agent workspace"
  homepage "https://github.com/RyanStoffel/forge"

  livecheck do
    skip "Forge app casks follow the project's continuously published edge channel"
  end

  depends_on macos: :monterey

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
