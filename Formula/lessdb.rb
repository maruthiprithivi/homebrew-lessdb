class Lessdb < Formula
  desc "One database for agents and humans — SQL + MCP in one binary"
  homepage "https://lessdb.dev"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://lessdb.pages.dev/dl/lessdb-v0.2.0-aarch64-apple-darwin.tar.gz?v=491224a4f3a7"
      sha256 "491224a4f3a789307b1c43af7a39da7582a2b22e364f321c72b56c2d8b10f712"
    end
  end

  on_linux do
    on_intel do
      url "https://lessdb.pages.dev/dl/lessdb-v0.2.0-x86_64-unknown-linux-gnu.tar.gz?v=aae0d5712266"
      sha256 "aae0d57122660370217750f859130f0ad8934ffa4c651f5fdb9b0d4a1138b2bc"
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
