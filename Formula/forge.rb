class Forge < Formula
  desc "Native terminal, editor, Git, and coding-agent workspace"
  homepage "https://github.com/RyanStoffel/forge"
  version "0.1.0-edge.6529712"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RyanStoffel/forge/releases/download/edge/forge-aarch64-apple-darwin"
      sha256 "e1740ce929888be540aa2a1ab16a293035afef290daea3d1b3b72322312db67e"
    else
      url "https://github.com/RyanStoffel/forge/releases/download/edge/forge-x86_64-apple-darwin"
      sha256 "e2c41c836cdf72f3440372f7ca3c49afcc397081ee3cf52ed0bc668cb91a72cc"
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
