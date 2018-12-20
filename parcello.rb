# frozen_string_literal: true

require 'formula'
require 'language/go'

# Homebrew formula that install Parcello
class Parcello < Formula
  desc 'Golang Resource Bundler and Embedder'
  homepage 'https://phogolabs.github.io/opensource/parcello/index.html'
  url 'https://github.com/phogolabs/parcello/archive/v0.8.1.tar.gz'
  sha256 '68a328e3f42cb424a9f7ee7834d0ea5a1c456f678d701b1f0f94c89f1087e079'
  version '0.8.1'

  depends_on 'go' => :build

  def install
    configure do |package_dir, package_name|
      Dir.chdir(package_dir) do
        system 'go', 'mod', 'download'
        system 'go', 'mod', 'verify'
        system 'go', 'build', "#{package_name}/cmd/parcello"

        bin.install 'parcello'
      end
    end
  end

  def configure
    go_path = "#{buildpath}/go"
    package_name = "github.com/phogolabs/parcello"
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
    version = pipe_output("#{bin}/parcello -v")
    assert_match(/0.8/, version)
  end
end
