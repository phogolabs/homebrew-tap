# frozen_string_literal: true

require 'formula'
require 'language/go'

# Homebrew formula that install Prana
class Prana < Formula
  desc 'Golang Database Manager'
  homepage 'https://phogolabs.github.io/opensource/prana'
  url 'https://github.com/phogolabs/prana/archive/v1.0-beta-03.tar.gz'
  sha256 'cb5c72f08bda80682bdbf954ed69bbdb897aa3921c888e5a6589721afe0b0f1e'
  version '1.0-beta-03'

  depends_on 'go' => :build
  depends_on 'glide' => :build

  def install
    configure do |package_root, package_dir|
      package_name = "#{package_root}/prana"

      ENV['GO111MODULE'] = 'on'

      Dir.chdir(package_dir) do
        system 'go', 'get', '-v'
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
