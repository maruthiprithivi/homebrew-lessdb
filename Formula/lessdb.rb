class Lessdb < Formula
  desc "One database for agents and humans — SQL + MCP in one binary"
  homepage "https://lessdb.dev"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://lessdb.pages.dev/dl/lessdb-v0.6.0-aarch64-apple-darwin.tar.gz?v=facc73e7f90b"
      sha256 "facc73e7f90bafdd1ce893d2b7c8d2b5b53ca03f20b9b11760e69b9f8dc4a062"
    end
  end

  on_linux do
    on_intel do
      url "https://lessdb.pages.dev/dl/lessdb-v0.6.0-x86_64-unknown-linux-gnu.tar.gz?v=70cf54a7d1e1"
      sha256 "70cf54a7d1e17131b9d781c974ee29f43202f52e785d0f64ef9c97fb5b4f9508"
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
