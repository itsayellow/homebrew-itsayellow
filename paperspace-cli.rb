require "language/node"

class PaperspaceCli < Formula
  desc "Paperspace CLI to manage Paperspace cloud compute resources"
  homepage "https://www.paperspace.com/api"
  url "https://github.com/Paperspace/paperspace-node/archive/0.1.17.tar.gz"
  sha256 "3cdd31cc242ac7f260388d64076f37197203cd075a81f0f321d1c2f8523db9fd"

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
