class Forge < Formula
  desc "Native terminal, editor, Git, and coding-agent workspace"
  homepage "https://github.com/RyanStoffel/forge"
  version "0.1.0-edge.e1b322f"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RyanStoffel/forge/releases/download/edge/forge-aarch64-apple-darwin"
      sha256 "289dc25886f9079a35c4a1609d0c6fff4f95eb41f3c68ef07c3476575ba21eb8"
    else
      url "https://github.com/RyanStoffel/forge/releases/download/edge/forge-x86_64-apple-darwin"
      sha256 "a6108853673331b4ed9c0bc976a6406b9cec35ac028645045a5aa4bb37e1c2a4"
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
