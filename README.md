# dotfiles are 🦄🦄
[![GitHub Actions Build Status](https://github.com/keidarcy/dotfiles/workflows/test%20dotfiles/badge.svg)](https://github.com/keidarcy/dotfiles/actions?workflow=test%20dotfiles)

# Quick Start

```sh
git clone https://github.com/keidarcy/dotfiles.git ${HOME}/dotfiles
cd ${HOME}/dotfiles
sh .github/bootstrap.sh
```

# Manually Start

```sh
git clone https://github.com/keidarcy/dotfiles.git ${HOME}/dotfiles
cd ${HOME}/dotfiles
stow */
```

```sh
stow vim # use vim setting only
```

# Submodule

```
git submodule update --init -- personal-dotfiles
git submodule update --init -- alacritty/.config/alacritty/themes
```
