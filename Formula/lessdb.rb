class Lessdb < Formula
  desc "One database for agents and humans — SQL + MCP in one binary"
  homepage "https://lessdb.dev"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://lessdb.pages.dev/dl/lessdb-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "b56b46d5423cbd3decba6aedfce934e7cf28187398a5407bab0b84bd420fe34b"
    end
  end

  on_linux do
    on_intel do
      url "https://lessdb.pages.dev/dl/lessdb-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c246128cc474bec25aa8186797369c8e9f83aa4979745a3431030fbed81f44a"
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
