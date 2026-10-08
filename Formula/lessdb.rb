class Lessdb < Formula
  desc "One database for agents and humans — SQL + MCP in one binary"
  homepage "https://lessdb.dev"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://lessdb.pages.dev/dl/lessdb-v0.6.0-aarch64-apple-darwin.tar.gz?v=9b7705f56efe"
      sha256 "9b7705f56efe83725da6675fc7ea0c638ce6fc2f80fd12b0b029c3f6eaac363e"
    end
  end

  on_linux do
    on_intel do
      url "https://lessdb.pages.dev/dl/lessdb-v0.6.0-x86_64-unknown-linux-gnu.tar.gz?v=0606ec7e1fdd"
      sha256 "0606ec7e1fdd247c1470ed33739100dcf688f37ed354d674c79a4c0ba8e32a44"
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
