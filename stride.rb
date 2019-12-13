# This file was generated by GoReleaser. DO NOT EDIT.
class Stride < Formula
  desc "Golang Database Management and Code Generation"
  homepage "https://github.com/phogolabs/prana"
  version "1.0.0-rc1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc1/prana_1.0.0-rc1_darwin_amd64.tar.gz"
    sha256 "3dfc1572e52360618153067863f683f80bcce6ffd7dde1bb1e6422462d22d5f2"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc1/prana_1.0.0-rc1_linux_amd64.tar.gz"
      sha256 "638e96a70f2dfbdc456866cc891caaad09e5c545344b89978fa5a2162eb0fe3b"
    end
  end

  def install
    bin.install "prana"
  end

  test do
    system "#{bin}/prana -v"
  end
end