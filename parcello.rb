# frozen_string_literal: true

require 'formula'
require 'language/go'

# Homebrew formula that install Parcello
class Parcello < Formula
  desc 'Golang Resource Bundler'
  homepage 'https://phogolabs.github.io/opensource/parcello'
  url 'https://github.com/phogolabs/parcello/archive/v0.4.tar.gz'
  sha256 'a0975a74a0e39bcb87d755d7b4f9c9a371cc608aed3a64237ea60ff6c93987fa'
  version '0.4'

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
    assert_match(/0.4/, version)
  end
end
