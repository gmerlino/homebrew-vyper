class Pyscrypt < Formula
  include Language::Python::Virtualenv

  desc "Python bindings for the scrypt KDF"
  homepage "https://pypi.org/project/scrypt/"
  url "https://files.pythonhosted.org/packages/1f/af/70a7cb4f27f1673bc8b6af3587545eb0327e5823ab96b1eb81b541fe087e/scrypt-0.8.7.tar.gz"
  sha256 "b97744546656d98c4eff72da7856067ba21a538c34d519a346d4be3a66385342"

  depends_on "libyaml"
  depends_on "openssl"
  depends_on "python"

  resource "shellescape" do
    url "https://files.pythonhosted.org/packages/dd/72/797570d91fd1ba785966c43f12d5a6dec40438ba727dd02dbf636032b0a1/shellescape-3.4.1.tar.gz"
    sha256 "e618b2bc13f2553315ca1669995dc10fcc2cae5f1e0fda49035ef02d56f0b358"
  end

  resource "Naked" do
    url "https://files.pythonhosted.org/packages/62/0e/7b009568d9bbd8c0e659f1ea286e68d80f4cc31daa18447299c39445541f/Naked-0.1.31.tar.gz"
    sha256 "12b76b8a14595d07039422f1d2219ca8fbef8b237f9cdf5d8e947c03e148677e"
  end

  resource "PyYAML" do
    url "http://pyyaml.org/download/pyyaml/PyYAML-3.13.tar.gz"
    sha256 "3ef3092145e9b70e3ddd2c7ad59bdd0252a94dfe3949721633e41344de00a6bf"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/52/2c/514e4ac25da2b08ca5a464c50463682126385c4272c18193876e91f4bc38/requests-2.21.0.tar.gz"
    sha256 "502a824f31acdacb3a35b6690b5fbf0bc41d63a24a45c4004352b0242707598e"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/55/54/3ce77783acba5979ce16674fc98b1920d00b01d337cfaaf5db22543505ed/certifi-2018.11.29.tar.gz"
    sha256 "47f9c83ef4c0c621eaef743f133f09fa8a74a9b75f037e8624f83bd1b6626cb7"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/b1/53/37d82ab391393565f2f831b8eedbffd57db5a718216f82f1a8b4d381a1c1/urllib3-1.24.1.tar.gz"
    sha256 "de9529817c93f27c8ccbfead6985011db27bd0ddfcdb2d86f3f663385c6a9c22"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/ad/13/eb56951b6f7950cadb579ca166e448ba77f9d24efc03edd7e55fa57d04b7/idna-2.8.tar.gz"
    sha256 "c357b3f628cf53ae2c4c05627ecc484553142ca23264e593d327bcde5e9c3407"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  def install
    ENV.prepend "LDFLAGS", "-L#{Formula["openssl"].opt_lib}", "-L#{Formula["libyaml"].opt_lib}"
    ENV.prepend "CFLAGS", "-I#{Formula["openssl"].opt_include}", "-I#{Formula["libyaml"].opt_include}"
    virtualenv_install_with_resources
  end

  test do
  end
end
