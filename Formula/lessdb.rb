class Lessdb < Formula
  desc "One database for agents and humans — SQL + MCP in one binary"
  homepage "https://lessdb.dev"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://lessdb.pages.dev/dl/lessdb-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "79ee46c0a9e35a7e5dc07ef2cd50c98426ec5fad4404821a3c54a14d9cbb60ed"
    end
  end

  on_linux do
    on_intel do
      url "https://lessdb.pages.dev/dl/lessdb-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8176d0411ac31db56fd7c260aab25d055c73a39adf3cc13f0275d58e1531515"
    end
  end

  def install
    bin.install "less"
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
