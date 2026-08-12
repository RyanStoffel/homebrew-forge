cask "forge-app" do
  version "0.1.0-edge.e1b322f"

  on_arm do
    sha256 "66a099b87d523b74d8c19f08a7eedb6ddf6e2da035267c28574dfa77c16b83df"
    url "https://github.com/RyanStoffel/forge/releases/download/forge-app-#{version}/Forge-aarch64-apple-darwin.zip"
  end
  on_intel do
    sha256 "7f38c3644398154529d1a34e5c38f01cd3bd068f024df142ea7bfc2861f2fcd1"
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
