## Dotfiles

This repo is for me to reproduce my dotfiles on new systems using git and GNU Stow.

## Usage

1. Clone the repo:

```sh
git clone https://github.com/adamferrick/dotfiles.git $HOME/.dotfiles
```

2. Build the symlinks using Stow.

```sh
cd ~/.dotfiles
stow --restow --no-folding .
```
