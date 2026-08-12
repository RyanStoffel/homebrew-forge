# RyanStoffel Homebrew Tap

Homebrew distribution for [Forge](https://github.com/RyanStoffel/forge), a native Rust + GPUI terminal, editor, Git, and coding-agent workspace.

## Install the desktop app

```bash
brew tap RyanStoffel/forge
brew install --cask forge-app
```

Forge is installed as `/Applications/Forge.app`, appears in Finder and Spotlight, and can be launched with:

```bash
open -a Forge
```

The cask also links the embedded executable as `forge`, so `forge` remains available from the terminal.

If the older formula-only distribution is installed, migrate once:

```bash
brew uninstall --formula RyanStoffel/forge/forge
brew install --cask RyanStoffel/forge/forge-app
```

## Update

```bash
brew update
brew upgrade --cask forge-app
```

Forge currently follows the automatically published `edge` release on every successful push to `main`. Each cask version uses an immutable architecture-specific app archive and SHA-256 checksum.

Forge is macOS-only at this stage. Edge app bundles are ad-hoc signed but not yet Developer ID signed or notarized, so macOS may require **System Settings → Privacy & Security → Open Anyway** on first launch.

## Command-line-only formula

The legacy formula remains available for automation and terminal-only installation:

```bash
brew install --formula RyanStoffel/forge/forge
```

It installs only the executable and does not create an application in `/Applications`.
