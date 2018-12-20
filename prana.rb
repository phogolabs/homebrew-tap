# frozen_string_literal: true

require 'formula'
require 'language/go'

# Homebrew formula that install Prana
class Prana < Formula
  desc 'Golang Database Manager'
  homepage 'https://phogolabs.github.io/opensource/prana'
  url 'https://github.com/phogolabs/prana/archive/v1.0-beta-04.tar.gz'
  sha256 '4302f519cbfc5292080096736b351ced8a9740f0a0b4ebe387925bbb949d0aee'
  version '1.0-beta-04'

  depends_on 'go' => :build

  def install
    configure do |package_root, package_dir|
      Dir.chdir(package_dir) do
        system "script/build.sh"
      end

      bin.install 'prana'
    end
  end

  def configure
    ENV['GOPATH'] = buildpath
    package_root = 'github.com/phogolabs'
    package_root_dir = "#{buildpath}/src/#{package_root}"
    package_dir = "#{package_root_dir}/prana"

    mkdir_p package_root_dir
    ln_sf buildpath, package_dir

    yield package_root, package_dir
  end

  test do
    version = pipe_output("#{bin}/prana -v")
    assert_match(/1.0/, version)
  end
end
