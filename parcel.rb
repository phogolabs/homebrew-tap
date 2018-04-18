# frozen_string_literal: true

require 'formula'
require 'language/go'

# Homebrew formula that install Parcel
class Parcel < Formula
  desc 'Golang Resource Bundler'
  homepage 'https://phogolabs.github.io/opensource/parcel'
  url 'https://github.com/phogolabs/parcel/archive/v0.3.tar.gz'
  sha256 'aeafd3f0cf2d2198ba35924455e4fcd59cf9ef894ee4aa64d385d52e7cb5b07b'
  version '0.3'

  depends_on 'go' => :build
  depends_on 'glide' => :build

  def install
    ENV['GOPATH'] = buildpath
    package_root = 'github.com/phogolabs'
    package_root_dir = "#{buildpath}/src/#{package_root}"
    package_name = "#{package_root}/parcel"
    package_dir = "#{package_root_dir}/parcel"

    mkdir_p package_root_dir
    ln_sf buildpath, package_dir

    Dir.chdir(package_dir) do
      system 'glide', 'install'
    end

    system 'go', 'build', "#{package_name}/cmd/parcel"
    bin.install 'parcel'
  end

  test do
    version = pipe_output("#{bin}/parcel -v")
    assert_match(/0.1/, version)
  end
end
