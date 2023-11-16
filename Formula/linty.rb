class Linty < Formula
  desc "Simple, language-agnostic linter"
  if Hardware::CPU.type == :arm
    url "https://github.com/rwblickhan/linty/releases/download/v0.3.3/linty-aarch64-apple-darwin.tar.gz"
    sha256 "8be8d0719b921ffd75fe710405d5bdc405399183b11a19d16eebed7cc02e29e4"
  else
    url "https://github.com/rwblickhan/linty/releases/download/v0.3.3/linty-x86_64-apple-darwin.tar.gz"
    sha256 "82df8a253fcd43ea22ca67a0532f2bd5c994f40e92874d9cc0d8170983a701ac"
  end
  version "0.3.3"
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
