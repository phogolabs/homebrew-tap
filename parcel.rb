# frozen_string_literal: true

require 'formula'
require 'language/go'

# Homebrew formula that install Parcel
class Parcel < Formula
  desc 'Golang Resource Bundler'
  homepage 'https://phogolabs.github.io/opensource/parcel'
  url 'https://github.com/phogolabs/parcel/archive/v0.2.tar.gz'
  sha256 'fe634242733e1f2f051605c026ca9abd00a96d3c099503ce99888f707c85550e'
  version '0.2'

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
