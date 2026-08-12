cask "forge-app" do
  version "0.1.0-edge.3c9eb4a"

  on_arm do
    sha256 "2f697c1d4a04e7ccd6ef4838af588a88ba3144995b763d379a0ef4826b77e838"
    url "https://github.com/RyanStoffel/forge/releases/download/forge-app-#{version}/Forge-aarch64-apple-darwin.zip"
  end
  on_intel do
    sha256 "400fd92f0a000d9e4d8750edc83147b85151a05edde262f732c11c275399f389"
    url "https://github.com/RyanStoffel/forge/releases/download/forge-app-#{version}/Forge-x86_64-apple-darwin.zip"
  end

  name "Forge"
  desc "Native terminal, editor, Git, and coding-agent workspace"
  homepage "https://github.com/RyanStoffel/forge"

  livecheck do
    skip "Forge app casks follow the project's continuously published edge channel"
  end

  depends_on macos: ">= :monterey"

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
