class Forge < Formula
  desc "Native terminal, editor, Git, and coding-agent workspace"
  homepage "https://github.com/RyanStoffel/forge"
  version "0.1.0-edge.2f29014"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RyanStoffel/forge/releases/download/edge/forge-aarch64-apple-darwin"
      sha256 "8cd03c661d9e895715da2a80ef86ff617d85823df5f19ea6602aa169ea76056f"
    else
      url "https://github.com/RyanStoffel/forge/releases/download/edge/forge-x86_64-apple-darwin"
      sha256 "c6806649dac1d8dccf5f614e0b92acf20f6b6ffd0bebd4a636df3097b8b206ef"
    end
  end

  def install
    artifact = Dir["forge-*-apple-darwin"].first
    odie "Forge release artifact is missing" unless artifact

    bin.install artifact => "forge"
  end

  test do
    assert_match version.major_minor_patch.to_s, shell_output("#{bin}/forge --version")
  end
end
