class Linty < Formula
  desc "Simple, language-agnostic linter"
  if Hardware::CPU.type == :arm
    url "https://github.com/rwblickhan/linty/releases/download/v0.2.0/linty-aarch64-apple-darwin.tar.gz"
    sha256 "ebf3d59d8464e3bb62cdebfb9177895e1f14211525f2aabd1e7427574aeb6583"
  else
    url "https://github.com/rwblickhan/linty/releases/download/v0.2.0/linty-x86_64-apple-darwin.tar.gz"
    sha256 "f720eb5d73a59790722674e89fdf59ad9b500e3b0bd99cd609fa90265d7d1cd6"
  end
  version "0.2.0"
  license "MIT"

  def install
    bin.install "linty"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
