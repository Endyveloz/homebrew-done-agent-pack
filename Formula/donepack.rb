require "language/node"

class Donepack < Formula
  desc "Turn any folder into a Done-style agentic workspace for coding agents"
  homepage "https://done.dev"
  url "https://registry.npmjs.org/done-agent-pack/-/done-agent-pack-0.14.0.tgz"
  sha256 "608b8f24e46cc78e32082791538d514b7ac8546dbfa5ac050273692148c74cb7"
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
