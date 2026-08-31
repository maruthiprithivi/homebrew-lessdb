class Lessdb < Formula
  desc "One database for agents and humans — SQL + MCP in one binary"
  homepage "https://lessdb.dev"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://lessdb.pages.dev/dl/lessdb-v0.4.0-aarch64-apple-darwin.tar.gz?v=aa4039a3e2be"
      sha256 "aa4039a3e2be0b349d823c429b9d1e0e281cffa606de4eca66c32ee0358247d1"
    end
  end

  on_linux do
    on_intel do
      url "https://lessdb.pages.dev/dl/lessdb-v0.4.0-x86_64-unknown-linux-gnu.tar.gz?v=e2c455d90407"
      sha256 "e2c455d904076237dce2ec0c98234437eb3a024345c633443c3ebb1e045be4d3"
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
