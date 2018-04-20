# frozen_string_literal: true

require 'formula'
require 'language/go'

# Homebrew formula that install Parcello
class Parcello < Formula
  desc 'Golang Resource Bundler'
  homepage 'https://phogolabs.github.io/opensource/parcello'
  url 'https://github.com/phogolabs/parcello/archive/v0.7.tar.gz'
  sha256 '1c77a759e3ddac03753cdfc0e67bff39cad1485d6fb79dfd3a2e6c545930d40c'
  version '0.7'

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
    assert_match(/0.7/, version)
  end
end
