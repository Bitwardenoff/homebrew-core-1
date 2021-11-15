require "language/node"

class CubejsCli < Formula
  desc "Cube.js command-line interface"
  homepage "https://cube.dev/"
  url "https://registry.npmjs.org/cubejs-cli/-/cubejs-cli-0.28.56.tgz"
  sha256 "6d9a07ba730a3228bb53a20d91a6b83e89ede3ccb11e4f56d6e20c67ee893eae"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "e629117555b6cb40bf43afaa8ea104df78b09ba4181aefd7feb0f99e0132a3f7"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "e629117555b6cb40bf43afaa8ea104df78b09ba4181aefd7feb0f99e0132a3f7"
    sha256 cellar: :any_skip_relocation, monterey:       "f561e48aad92a12260a6d9f7ab9c0cc6fc957529ef53d5a446a8cc1151e9af82"
    sha256 cellar: :any_skip_relocation, big_sur:        "f561e48aad92a12260a6d9f7ab9c0cc6fc957529ef53d5a446a8cc1151e9af82"
    sha256 cellar: :any_skip_relocation, catalina:       "f561e48aad92a12260a6d9f7ab9c0cc6fc957529ef53d5a446a8cc1151e9af82"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e629117555b6cb40bf43afaa8ea104df78b09ba4181aefd7feb0f99e0132a3f7"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cubejs --version")
    system "cubejs", "create", "hello-world", "-d", "postgres"
    assert_predicate testpath/"hello-world/schema/Orders.js", :exist?
  end
end
