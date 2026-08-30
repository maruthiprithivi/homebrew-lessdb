class Lessdb < Formula
  desc "One database for agents and humans — SQL + MCP in one binary"
  homepage "https://lessdb.dev"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://lessdb.pages.dev/dl/lessdb-v0.1.0-aarch64-apple-darwin.tar.gz?v=4bde68bfb18a"
      sha256 "4bde68bfb18ac0af316efca29a1f8290d6d2dd50e5475ac0b2c94b26e94f8a81"
    end
  end

  on_linux do
    on_intel do
      url "https://lessdb.pages.dev/dl/lessdb-v0.1.0-x86_64-unknown-linux-gnu.tar.gz?v=e7a02c13eb4b"
      sha256 "e7a02c13eb4bd4a2b371b5e098934fd7b314d6672ac631c585f242a7e8aca4ec"
    end
  end

  def install
    bin.install "lessdb"
  end

  def caveats
    <<~EOS
      The `cloud` variant (S3/GCS/Azure/R2 object-store backends for
      SharedMergeTree) is available from the downloads page or npm:
        https://lessdb.dev/downloads/
      This tap covers macOS (Apple Silicon) and Linux x86_64; other
      platforms can `cargo install --path crates/less-cli` from source.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lessdb --version")
  end
end
