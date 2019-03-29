require "language/node"

class PaperspaceCli < Formula
  desc "Paperspace CLI for Paperspace cloud compute resources."
  homepage "https://www.paperspace.com/api"
  url "https://github.com/Paperspace/paperspace-node/archive/0.1.13.tar.gz"
  sha256 "d94951ba05bcf8f5c093503904299c6ed705111ec79eedda85081b82ee77ed8f"

  depends_on "npm" => :build

  def install
    system "npm", "install", *Language::Node.local_npm_install_args
    system "npm", "install", "pkg", *Language::Node.local_npm_install_args
    system "./node_modules/.bin/pkg", "-t", "node10", "."
    File.rename("paperspace-node", "paperspace")
    prefix.install "paperspace"
    bin.install_symlink prefix/"paperspace"
  end

  test do
    system "#{bin}/paperspace", "--version"
    system "#{bin}/paperspace", "--help"
    # Unfortunately testing all other paperspace functionality requires user
    #   credentials. (i.e. paperspace login)
    #system "#{bin}/paperspace", "templates", "list"
    #system "#{bin}/paperspace", "networks", "list"
    #system "#{bin}/paperspace", "machines", "availability", "--region", "'East Coast (NY2)'", "--machineType", "'GPU+'"
    #system "#{bin}/paperspace", "users", "list"
  end
end
