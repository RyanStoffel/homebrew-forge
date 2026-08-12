cask "forge-app" do
  version "0.1.0-edge.39acd01"

  on_arm do
    sha256 "466f7eaa7af9ba418de73ae04b3ac79032e76a027374858503f43f60d3478246"
    url "https://github.com/RyanStoffel/forge/releases/download/edge-39acd01/Forge-aarch64-apple-darwin.zip"
  end
  on_intel do
    sha256 "99fc716576b952f36c31136786d656bffac14cd1fbb05c5690617ae17f437aab"
    url "https://github.com/RyanStoffel/forge/releases/download/edge-39acd01/Forge-x86_64-apple-darwin.zip"
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
