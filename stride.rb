# This file was generated by GoReleaser. DO NOT EDIT.
class Stride < Formula
  desc "Golang Database Management and Code Generation"
  homepage "https://github.com/phogolabs/prana"
  version "1.0.0-rc1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc1/prana_1.0.0-rc1_darwin_amd64.tar.gz"
    sha256 "36b20bd5eebca31e36ec3284ff275837ca4f124fd7c90433d7221601eba2f922"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc1/prana_1.0.0-rc1_linux_amd64.tar.gz"
      sha256 "beaece48fc26de0b6706e41b918f1e0e1ce830a6dca41c0f89d6081486d06cf0"
    end
  end

  def install
    bin.install "prana"
  end

  test do
    system "#{bin}/prana -v"
  end
end
