class Pyasttokens < Formula
  include Language::Python::Virtualenv

  desc "Annotate AST trees with source code positions"
  homepage "https://pypi.org/project/asttokens/"
  url "https://files.pythonhosted.org/packages/1d/d2/cf56e804cd7b4e8b92813e943a815f96b0d2545c967927356783b6860a2e/asttokens-2.0.4.tar.gz"
  sha256 "a42e57e28f2ac1c85ed9b1f84109401427e5c63c04f61d15b8842b027eec5128"

  depends_on "python"

  def install
    virtualenv_install_with_resources
  end

  test do
  end
end
