class Forge < Formula
  desc "Native terminal, editor, Git, and coding-agent workspace"
  homepage "https://github.com/RyanStoffel/forge"
  version "0.1.0-edge.b8b5267"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RyanStoffel/forge/releases/download/edge/forge-aarch64-apple-darwin"
      sha256 "8a2210c6a3155bd2f662a8f0c97cd2f41bfe511ba8a7660e2e26b07601190ee5"
    else
      url "https://github.com/RyanStoffel/forge/releases/download/edge/forge-x86_64-apple-darwin"
      sha256 "96ecad3c7a19f9fa90bd774556ae72e45886eeb8938ad7823755e1e5eca9bd41"
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
