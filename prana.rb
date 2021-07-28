# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Prana < Formula
  desc "Golang Database Management and Code Generation"
  homepage "https://github.com/phogolabs/prana"
  version "1.0.0-rc8"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc8/prana_1.0.0-rc8_darwin_amd64.tar.gz"
      sha256 "0410d740413a3506b669a770e4366bce3f7d7ee01823d350217bee4be2fa5414"
    end
    if Hardware::CPU.arm?
      url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc8/prana_1.0.0-rc8_darwin_arm64.tar.gz"
      sha256 "0f411dab4fa3711464683583203981260a4f58900cf193f9555b86120986eb6f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc8/prana_1.0.0-rc8_linux_amd64.tar.gz"
      sha256 "eef061bc65cf4b542469a905098287e768992d75d2bd53bd56b904a7a4b8c8f3"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc8/prana_1.0.0-rc8_linux_arm64.tar.gz"
      sha256 "f8fb911debb226a5b6a53d9bfab909f67257dc9507d5851aecd8aa1af2fa3325"
    end
  end

  def install
    bin.install "prana"
  end

  test do
    system "#{bin}/prana -v"
  end
end
