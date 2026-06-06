# homebrew-done-agent-pack

A [Homebrew](https://brew.sh) tap for **[Done Agent Pack](https://github.com/Endyveloz/done)** — the `donepack` CLI.

Done Agent Pack turns any folder into a Done-style agentic workspace for coding agents (Claude Code, Cursor, Codex): forward-motion execution, roadmap-first development, agent-owned QA.

## Install

```sh
brew tap endyveloz/done-agent-pack
brew install donepack
```

Then:

```sh
donepack init my-project
donepack --version
```

## What the formula does

`donepack` is distributed on npm as [`done-agent-pack`](https://www.npmjs.com/package/done-agent-pack). The formula installs it via `npm` into Homebrew's prefix and symlinks the `donepack` binary, with `node` as a managed dependency. No global npm install or PATH fiddling required.

## Other ways to install

If you'd rather not use Homebrew:

```sh
# Run once, no install
npx done-agent-pack init my-project

# Global npm install
npm install -g done-agent-pack

# One-line installer
curl -fsSL https://done.dev/install.sh | sh
```

## Updating

```sh
brew update
brew upgrade donepack
```

## Links

- Docs: <https://done.dev>
- Main repo: <https://github.com/Endyveloz/done>
- npm: <https://www.npmjs.com/package/done-agent-pack>

## License

MIT. The formula in this tap and the `done-agent-pack` package are MIT licensed.
