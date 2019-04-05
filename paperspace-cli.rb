require "language/node"

class PaperspaceCli < Formula
  desc "Paperspace CLI to manage Paperspace cloud compute resources"
  homepage "https://www.paperspace.com/api"
  url "https://github.com/Paperspace/paperspace-node/archive/0.1.14.tar.gz"
  version "0.1.14"
  sha256 "79fb9e74182c49209868cf587a19debbeee0ca4fa0affb38b7015a24eda64c0d"

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
