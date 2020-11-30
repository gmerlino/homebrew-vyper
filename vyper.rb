class Vyper < Formula
  include Language::Python::Virtualenv

  desc "Pythonic Smart Contract Language for the EVM"
  homepage "https://github.com/ethereum/vyper"
  head "https://github.com/ethereum/vyper.git"

  depends_on "gmp"
  depends_on "leveldb"
  depends_on "libyaml"
  depends_on "pyscrypt"
  depends_on "python"

  resource "pycrypto" do
    url "https://files.pythonhosted.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz"
    sha256 "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
  end

  resource "pysha3" do
    url "https://files.pythonhosted.org/packages/73/bf/978d424ac6c9076d73b8fdc8ab8ad46f98af0c34669d736b1d83c758afee/pysha3-1.0.2.tar.gz"
    sha256 "fe988e73f2ce6d947220624f04d467faf05f1bbdbc64b0a201296bb3af92739e"
  end

  def install
     virtualenv_install_with_resources
  end

  test do
#    (testpath/"hello.sml").write <<~'EOS'
#      val () = print "Hello, Homebrew!\n"
#    EOS
#    system "#{bin}/mlton", "hello.sml"
#    assert_equal "Hello, Homebrew!\n", `./hello`
    system "make", "test"
  end
end