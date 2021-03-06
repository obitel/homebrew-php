require File.expand_path("../../language/php", __FILE__)

class PhanAT08 < Formula
  include Language::PHP::Composer

  desc "Static analyzer for PHP"
  homepage "https://github.com/phan/phan"
  url "https://github.com/etsy/phan/archive/0.8.9.tar.gz"
  sha256 "f1de7f724ee6eefdb9176143f1ccf2394cb7d4a9ec396a6358b6e838ccb40f17"
  head "https://github.com/phan/phan.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "08acc1bcf5b9ac967ee9daec20f5702f1a13b055b72fdce478bec90903dfdaea" => :high_sierra
    sha256 "53c06af8f6c92e6d860a6e2051a71edfb88ff77cd174f49b0d5c94aad5cd32d9" => :sierra
    sha256 "0c71909a68de074e661d2be7754ac33cfad317593d95eb4b9556fcc95fa0a4b5" => :el_capitan
  end

  depends_on "php70-ast"
  depends_on "php70"

  def install
    composer_install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"phan"
  end

  test do
    system "#{bin}/phan", "--help"
  end
end
