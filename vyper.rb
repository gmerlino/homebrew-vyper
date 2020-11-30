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

  resource "asttokens" do
    url "https://files.pythonhosted.org/packages/1d/d2/cf56e804cd7b4e8b92813e943a815f96b0d2545c967927356783b6860a2e/asttokens-2.0.4.tar.gz"
    sha256 "a42e57e28f2ac1c85ed9b1f84109401427e5c63c04f61d15b8842b027eec5128"
  end

  resource "pycrypto" do
    url "https://files.pythonhosted.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz"
    sha256 "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
  end

  resource "pysha3" do
    url "https://files.pythonhosted.org/packages/73/bf/978d424ac6c9076d73b8fdc8ab8ad46f98af0c34669d736b1d83c758afee/pysha3-1.0.2.tar.gz"
    sha256 "fe988e73f2ce6d947220624f04d467faf05f1bbdbc64b0a201296bb3af92739e"
  end

  def install
     mkdir_p pkgshare
     cp_r "examples", pkgshare
     virtualenv_install_with_resources
#     (pkgshare/"examples").install Dir["examples"]
  end

  test do
    system "make", "test"
#    cp pkgshare/"examples/crowdfund.vy", testpath
    system "vyper", "crowdfund.vy"
    system "vyper", "#{pkgshare}/examples/crowdfund.vy"
  end
end
