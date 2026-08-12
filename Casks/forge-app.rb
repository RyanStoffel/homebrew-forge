cask "forge-app" do
  version "0.1.0,1cd0afc"

  on_arm do
    sha256 "c183a804b7091e054490644d4c44e68b3857942b6e12a10bada0d993b9c0d48f"
    url "https://github.com/RyanStoffel/forge/releases/download/edge-#{version.csv.second}/Forge-aarch64-apple-darwin.zip"
  end
  on_intel do
    sha256 "ac58329124422623e93403ee42df63ed9b64e1e0e11aeaf5d88619fec11d091d"
    url "https://github.com/RyanStoffel/forge/releases/download/edge-#{version.csv.second}/Forge-x86_64-apple-darwin.zip"
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
