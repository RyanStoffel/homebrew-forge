cask "forge-app" do
  version "0.1.0-edge.fda418f"

  on_arm do
    sha256 "a8ac26ccbc4c0464f7c18932410716503d4b704594e1cb251a8336e744ababda"
    url "https://github.com/RyanStoffel/forge/releases/download/forge-app-#{version}/Forge-aarch64-apple-darwin.zip"
  end
  on_intel do
    sha256 "62481d7912f1ee707a4bfabb431c02f20a82a03fa0eb4b581e73ed8fdef8f025"
    url "https://github.com/RyanStoffel/forge/releases/download/forge-app-#{version}/Forge-x86_64-apple-darwin.zip"
  end

  name "Forge"
  desc "Native terminal, editor, Git, and coding-agent workspace"
  homepage "https://github.com/RyanStoffel/forge"

  livecheck do
    skip "Forge app casks follow the project's continuously published edge channel"
  end

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
