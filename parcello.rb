# This file was generated by GoReleaser. DO NOT EDIT.
class Parcello < Formula
  desc "Golang Resource Bundler"
  homepage "https://github.com/phogolabs/parcello"
  version "0.8.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/phogolabs/parcello/releases/download/v0.8.2/parcello_0.8.2_darwin_amd64.tar.gz"
      sha256 "0a1248cb9f3f6def9234f45bcd904cc6707f3b98218c7335cb3b4b34f15abed9"

      def install
        bin.install "parcello"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/phogolabs/parcello/releases/download/v0.8.2/parcello_0.8.2_linux_amd64.tar.gz"
      sha256 "9487ea304724316bdc93b33b983141e75319b40cb9db0b793de86d72c17f8340"

      def install
        bin.install "parcello"
      end
    end
  end

  test do
    system "#{bin}/parcello -v"
  end
end
