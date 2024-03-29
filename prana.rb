# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Prana < Formula
  desc "Golang Database Management and Code Generation"
  homepage "https://github.com/phogolabs/prana"
  version "1.0.0-rc10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc10/prana_1.0.0-rc10_darwin_arm64.tar.gz"
      sha256 "55097076d441034309d0b8f29fcc1567741b2b3a1142c6888daf9e9cb321d69d"

      def install
        bin.install "prana"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc10/prana_1.0.0-rc10_darwin_amd64.tar.gz"
      sha256 "3577f6391d441ecf89b9c304696432571309fb016e9931567fd1cd4a3e799271"

      def install
        bin.install "prana"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc10/prana_1.0.0-rc10_linux_arm64.tar.gz"
      sha256 "fcc690e848cc4245b540c216cd5eef09b1b16a2e6be3dd85a96acc7dba57859a"

      def install
        bin.install "prana"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc10/prana_1.0.0-rc10_linux_armv6.tar.gz"
      sha256 "b163e9b88450174d427ecb0f09cd3b8c71f4d2357ce0333f34aab870804f6210"

      def install
        bin.install "prana"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc10/prana_1.0.0-rc10_linux_amd64.tar.gz"
      sha256 "8fffb69d123084af1d10dfc136a309b9a53c4cdff1673f55ce602d6cbb7c2f8e"

      def install
        bin.install "prana"
      end
    end
  end

  test do
    system "#{bin}/prana -v"
  end
end
