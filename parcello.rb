# frozen_string_literal: true

require 'formula'
require 'language/go'

# Homebrew formula that install Parcello
class Parcello < Formula
  desc 'Golang Resource Bundler'
  homepage 'https://phogolabs.github.io/opensource/parcello'
  url 'https://github.com/phogolabs/parcello/archive/v0.6.tar.gz'
  sha256 'be4f030fcbaf32841152eb73b2b9d8ad7fa5c8f2536d71d78b983c3a124d1332'
  version '0.6'

  depends_on 'go' => :build
  depends_on 'glide' => :build

  def install
    ENV['GOPATH'] = buildpath
    package_root = 'github.com/phogolabs'
    package_root_dir = "#{buildpath}/src/#{package_root}"
    package_name = "#{package_root}/parcello"
    package_dir = "#{package_root_dir}/parcello"

    mkdir_p package_root_dir
    ln_sf buildpath, package_dir

    Dir.chdir(package_dir) do
      system 'glide', 'install'
    end

    system 'go', 'build', "#{package_name}/cmd/parcello"
    bin.install 'parcello'
  end

  test do
    version = pipe_output("#{bin}/parcello -v")
    assert_match(/0.6/, version)
  end
end
