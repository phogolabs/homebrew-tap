# frozen_string_literal: true

require 'formula'
require 'language/go'

# Homebrew formula that install Prana
class Prana < Formula
  desc 'Golang Database Manager'
  homepage 'https://phogolabs.github.io/opensource/prana'
  url 'https://github.com/phogolabs/prana/archive/v1.0-beta.tar.gz'
  sha256 '99f95e2d6b1394561bc05de223661800e9d922c4223ffaad427878b5e05490f5'
  version '1.0-beta'

  depends_on 'go' => :build
  depends_on 'glide' => :build

  def install
    configure do |package_root, package_dir|
      package_name = "#{package_root}/prana"

      Dir.chdir(package_dir) do
        system 'glide', 'install'
        system 'go', 'build', "#{package_name}/cmd/prana"
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
