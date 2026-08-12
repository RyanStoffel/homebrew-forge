cask "forge-app" do
  version "0.1.0-edge.6529712"

  on_arm do
    sha256 "8ed7131ae16ea5188be83a2b1fbe039b7ea337e1ca771d3d1413c6831da11341"
    url "https://github.com/RyanStoffel/forge/releases/download/forge-app-#{version}/Forge-aarch64-apple-darwin.zip"
  end
  on_intel do
    sha256 "fb0f205e7de0d3fd03b3797733297d14bb3ec1f34d05ea26af32333726224483"
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
