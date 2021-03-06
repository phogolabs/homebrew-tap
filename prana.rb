# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Prana < Formula
  desc "Golang Database Management and Code Generation"
  homepage "https://github.com/phogolabs/prana"
  version "1.0.0-rc3"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc3/prana_1.0.0-rc3_darwin_amd64.tar.gz"
    sha256 "16257df8599d3df16c623eab4fb48c737ba9a358aba74511926773e4cb4b60ca"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc3/prana_1.0.0-rc3_darwin_arm64.tar.gz"
    sha256 "5239e7a91ed058fd228f7763ad701e764eca644e775b91f996d6447e0af35179"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc3/prana_1.0.0-rc3_linux_amd64.tar.gz"
    sha256 "baa7dff67b36017ef36da90c058632b848b5ee408ecec73c698f77177d2f1f65"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/phogolabs/prana/releases/download/v1.0.0-rc3/prana_1.0.0-rc3_linux_arm64.tar.gz"
    sha256 "a0098463a43af19097b1756d2fff297868a0f07b878b7470666011ec7109e3a4"
  end

  def install
    bin.install "prana"
  end

  test do
    system "#{bin}/prana -v"
  end
end
