class Lessdb < Formula
  desc "One database for agents and humans — SQL + MCP in one binary"
  homepage "https://lessdb.dev"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://lessdb.pages.dev/dl/lessdb-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "bc307f0ebe2cee1775e8a6382f507ae6fb8df4eaf14d8ac75f4f3780f11cc5d0"
    end
  end

  on_linux do
    on_intel do
      url "https://lessdb.pages.dev/dl/lessdb-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc2b32f9fbd187181ee599292d1430e260893cf19b0c86b4d5733e34b70c2a30"
    end
  end

  def install
    bin.install Dir["lessdb-*/less"]
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
    assert_match version.to_s, shell_output("#{bin}/less --version")
  end
end
