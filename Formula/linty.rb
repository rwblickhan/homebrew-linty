class Linty < Formula
  desc "Simple, language-agnostic linter"
  if Hardware::CPU.type == :arm
    url "https://github.com/rwblickhan/linty/releases/download/v0.3.2/linty-aarch64-apple-darwin.tar.gz"
    sha256 "c49834a67451de544431a96204af06ef6d8335c17898139f8901f003e21ce187"
  else
    url "https://github.com/rwblickhan/linty/releases/download/v0.3.2/linty-x86_64-apple-darwin.tar.gz"
    sha256 "7b0726d2dfbebdf6370c19efac3b3709830297c53960446ba367d2af6709f1ec"
  end
  version "0.3.2"
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
