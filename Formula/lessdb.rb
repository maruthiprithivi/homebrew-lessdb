class Lessdb < Formula
  desc "One database for agents and humans — SQL + MCP in one binary"
  homepage "https://lessdb.dev"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://lessdb.pages.dev/dl/lessdb-v0.5.0-aarch64-apple-darwin.tar.gz?v=4307e29564b3"
      sha256 "4307e29564b3851cabd3559abc74f9a2e06efbace66d8d5833d93c4c43ffab05"
    end
  end

  on_linux do
    on_intel do
      url "https://lessdb.pages.dev/dl/lessdb-v0.5.0-x86_64-unknown-linux-gnu.tar.gz?v=a1ece5ae79f6"
      sha256 "a1ece5ae79f68d576752d64449cf407969cb42072cdb827423bcffbce5710b9a"
    end
  end

  def install
    bin.install "lessdb"
  end

  def caveats
    <<~EOS
      The `cloud` variant (S3/GCS/Azure/R2 object-store backends for
      FireflyCloud) is available from the downloads page or npm:
        https://lessdb.dev/downloads/
      This tap covers macOS (Apple Silicon) and Linux x86_64; other
      platforms can `cargo install --path crates/less-cli` from source.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lessdb --version")
  end
end
