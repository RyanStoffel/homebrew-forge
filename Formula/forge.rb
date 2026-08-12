class Forge < Formula
  desc "Native terminal, editor, Git, and coding-agent workspace"
  homepage "https://github.com/RyanStoffel/forge"
  version "0.1.0-edge.3c9eb4a"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RyanStoffel/forge/releases/download/edge/forge-aarch64-apple-darwin"
      sha256 "04dcc11ac2a51cac55a3a8c20c4ba00dfb05ad2d03460071ab346ebd7d58b03f"
    else
      url "https://github.com/RyanStoffel/forge/releases/download/edge/forge-x86_64-apple-darwin"
      sha256 "baddeb64dcdc785f02b0d309de836c9c8df129505fcafc9137367af96b195322"
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
