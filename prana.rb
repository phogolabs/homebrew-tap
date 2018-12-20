# frozen_string_literal: true

require 'formula'
require 'language/go'
require 'fileutils'
require 'tmpdir'

# Homebrew formula that install Prana
class Prana < Formula
  desc 'Golang Database Manager'
  homepage 'https://phogolabs.github.io/opensource/prana'
  url 'https://github.com/phogolabs/prana/archive/v1.0-beta-04.tar.gz'
  sha256 '4302f519cbfc5292080096736b351ced8a9740f0a0b4ebe387925bbb949d0aee'
  version '1.0-beta-04'

  depends_on 'go' => :build

  def install
    configure do |package_dir, package_name|
      Dir.chdir(package_dir) do
        system 'go', 'mod', 'download'
        system 'go', 'mod', 'verify'
        system 'go', 'build', "#{package_name}/cmd/prana"

        bin.install 'prana'
      end
    end
  end

  def configure
    go_path = "#{buildpath}/go"
    package_name = "github.com/phogolabs/prana"
    package_dir = "#{go_path}/src/#{package_name}"

    mkdir_p package_dir

    Dir.glob("#{buildpath}/*").each do|file|
      FileUtils.mv(file, package_dir) unless file == go_path
    end

    ENV['GOPATH'] = go_path
    ENV['GO111MODULE'] = 'on'

    yield package_dir, package_name
  end

  test do
    version = pipe_output("#{bin}/prana -v")
    assert_match(/1.0/, version)
  end
end
