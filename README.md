# Nix Home Manager Configuration

Reproducible dev environment for macOS (aarch64) and Linux (x86_64) machines using home-manager.

## What's included

| Module | Contents |
|--------|----------|
| `packages.nix` | curl, wget, ripgrep, fd, jq, fzf, tree, htop, bat, eza, zoxide, dust, go, node, python3, rustup, gh, direnv |
| `tmux.nix` | Prefix C-a, vi-style pane resize, mouse support, catppuccin-style status bar |
| `neovim.nix` | Neovim with NvChad (auto-cloned on first activation) |
| `yazi.nix` | File manager with zsh integration |
| `zsh.nix` | Oh-my-zsh, powerlevel10k, autosuggestions, syntax highlighting |
| `git.nix` | Delta diffs, lazygit, git-absorb, conditional work/personal email |

## Prerequisites

Install Nix with flakes enabled:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

## Usage

### macOS

```bash
git clone <this-repo> ~/Projects/nixos
cd ~/Projects/nixos
nix run home-manager -- switch --flake .#darwin
```

### Linux dev hosts

```bash
git clone <this-repo> ~/nixos
cd ~/nixos
nix run home-manager -- switch --flake .#linux
```

### Updating

```bash
nix flake update
home-manager switch --flake .#darwin  # or .#linux
```

## Git email

- Default: `stefanmirandadev@gmail.com` (personal)
- Repos under `~/workplace/`: `stefmira@amazon.com.au` (work, automatic via gitdir conditional)

## Notes

- Powerlevel10k will prompt for configuration on first zsh launch. Copy `~/.p10k.zsh` into this repo to make it portable.
- NvChad is cloned to `~/.config/nvim` on first activation. Update it with `git pull` inside that directory.
- Linux username defaults to `stefmira` in `hosts/linux.nix` — change if your dev hosts differ.
