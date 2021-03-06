require File.expand_path("../../Abstract/abstract-php-phar", __FILE__)

class Phpunit < AbstractPhpPhar
  init
  desc "Programmer-oriented testing framework for PHP"
  homepage "https://phpunit.de"
  url "https://phar.phpunit.de/phpunit-6.4.2.phar"
  sha256 "bf429a37b0664d9997da31467b800e5de800ffc1f01350bec1774dc8c9dcac23"

  bottle do
    cellar :any_skip_relocation
    sha256 "ace16fe4324fdde844f2b4f6b2afe4b74b02e426069948c6d0880b7e12edc4bf" => :high_sierra
    sha256 "ace16fe4324fdde844f2b4f6b2afe4b74b02e426069948c6d0880b7e12edc4bf" => :sierra
    sha256 "ace16fe4324fdde844f2b4f6b2afe4b74b02e426069948c6d0880b7e12edc4bf" => :el_capitan
  end

  def phar_file
    "phpunit-#{version}.phar"
  end

  test do
    shell_output("#{bin}/phpunit --version").include?(version)
  end
end
