class Linty < Formula
  desc "Simple, language-agnostic linter"
  if Hardware::CPU.type == :arm
    url "https://github.com/rwblickhan/linty/releases/download/v0.4.0/linty-aarch64-apple-darwin.tar.gz"
    sha256 "c72cd6c9f0b36953966fa511b228cb8f54fd2d5e9fcd83ef827d10daa63b20ab"
  else
    url "https://github.com/rwblickhan/linty/releases/download/v0.4.0/linty-x86_64-apple-darwin.tar.gz"
    sha256 "5a70fb8f4bff4884baffd69797d75fde553f0a98b973423cee57fe204d1de3c0"
  end
  version "0.4.0"
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
