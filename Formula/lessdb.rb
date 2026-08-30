class Lessdb < Formula
  desc "One database for agents and humans — SQL + MCP in one binary"
  homepage "https://lessdb.dev"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://lessdb.pages.dev/dl/lessdb-v0.3.0-aarch64-apple-darwin.tar.gz?v=f6c1ef15f766"
      sha256 "f6c1ef15f766c716c11b1301b933f018cfb0128a92c631abdb463d8be287faf0"
    end
  end

  on_linux do
    on_intel do
      url "https://lessdb.pages.dev/dl/lessdb-v0.3.0-x86_64-unknown-linux-gnu.tar.gz?v=bd51464763e0"
      sha256 "bd51464763e07548e0c7ea348cfaaee9c67d6bde28cd995a746ca9b31792debb"
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
