class Linty < Formula
  desc "Simple, language-agnostic linter"
  if Hardware::CPU.type == :arm
    url "https://github.com/rwblickhan/linty/releases/download/v0.3.0/linty-aarch64-apple-darwin.tar.gz"
    sha256 "d991623298863b8b9ef51b5ede2e111efd104679254e6b73017c7a9f3df742ed"
  else
    url "https://github.com/rwblickhan/linty/releases/download/v0.3.0/linty-x86_64-apple-darwin.tar.gz"
    sha256 "8d52b9c42023a64e94715c4dad4330673ec06fa3f4695e654fedebb8ed04ab3c"
  end
  version "0.3.0"
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
