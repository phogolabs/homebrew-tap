# frozen_string_literal: true

require 'formula'
require 'language/go'

# Homebrew formula that install Parcello
class Parcello < Formula
  desc 'Golang Resource Bundler and Embedder'
  homepage 'https://phogolabs.github.io/opensource/parcello'
  url 'https://github.com/phogolabs/parcello/archive/v0.8.tar.gz'
  sha256 '32f7682f18a65a47a2e87a2b1b4adc9605421e17e739be447bcd867294d63b9a'
  version '0.8'

  depends_on 'go' => :build
  depends_on 'glide' => :build

  def install
    configure do |package_root, package_dir|
      package_name = "#{package_root}/parcello"

      Dir.chdir(package_dir) do
        system 'glide', 'install'
        system 'go', 'build', "#{package_name}/cmd/parcello"
        bin.install 'parcello'
      end
    end
  end

  def configure
    ENV['GOPATH'] = buildpath
    package_root = 'github.com/phogolabs'
    package_root_dir = "#{buildpath}/src/#{package_root}"
    package_dir = "#{package_root_dir}/parcello"

    mkdir_p package_root_dir
    ln_sf buildpath, package_dir

    yield package_root, package_dir
  end

  test do
    version = pipe_output("#{bin}/parcello -v")
    assert_match(/0.8/, version)
  end
end
