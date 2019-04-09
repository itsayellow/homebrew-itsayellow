require "language/node"

class PaperspaceCli < Formula
  desc "Paperspace CLI to manage Paperspace cloud compute resources"
  homepage "https://www.paperspace.com/api"
  url "https://github.com/Paperspace/paperspace-node/archive/0.1.15.tar.gz"
  sha256 "7a1ec6b7fdcd678492d14d78b89a526e5855d8643f9f64c9884b925f5de9e709"

  depends_on "node" => :build

  def install
    system "npm", "install", *Language::Node.local_npm_install_args
    system "npm", "install", "pkg", *Language::Node.local_npm_install_args
    # Use node10 because it's the latest node that pkg can work with.
    system "./node_modules/.bin/pkg", "-t", "node10", "."
    File.rename("paperspace-node", "paperspace")
    bin.install "paperspace"
  end

  test do
    system "#{bin}/paperspace", "--version"
    system "#{bin}/paperspace", "--help"
    # Unfortunately testing all other paperspace functionality requires user
    #   credentials. (i.e. paperspace login)
  end
end
