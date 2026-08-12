# RyanStoffel Homebrew Tap

Homebrew distribution for [Forge](https://github.com/RyanStoffel/forge), a native Rust + GPUI terminal, editor, Git, and coding-agent workspace.

## Install

```bash
brew tap RyanStoffel/forge
brew install forge
```

Or install in one command:

```bash
brew install RyanStoffel/forge/forge
```

## Update

```bash
brew update
brew upgrade forge
```

Forge currently follows the automatically published `edge` release on every successful push to `main`. The formula is updated by Forge's release workflow with architecture-specific SHA-256 checksums.

Forge is macOS-only at this stage and the edge binaries are not yet signed or notarized.
