require "language/node"

class Donepack < Formula
  desc "Turn any folder into a Done-style agentic workspace for coding agents"
  homepage "https://done.dev"
  url "https://registry.npmjs.org/done-agent-pack/-/done-agent-pack-0.1.1.tgz"
  sha256 "340936966e6b8ae0496443575abef67c888c14405ea59e0f1eaf5fa93f212b61"
  license "MIT"

  depends_on "node"

  def install
    # `--min-release-age=0` overrides Homebrew's supply-chain delay: our own
    # @donedev/* packages are first-party and may have been published minutes
    # ago, which the default min-release-age would otherwise reject.
    system "npm", "install", *std_npm_args, "--min-release-age=0"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/donepack --version")
    assert_match "donepack", output

    # init scaffolds a workspace into the given directory.
    system bin/"donepack", "init", testpath/"ws"
    assert_predicate testpath/"ws/AGENTS.md", :exist?
    assert_predicate testpath/"ws/.done", :exist?
  end
end
