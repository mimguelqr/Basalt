#!/bin/bash

set -e

# Pacman Package Installation

install_pacman_packages() {
  sudo pacman -Syu --noconfirm --needed - <pacman-pkglist.txt

  read -p "Do you want to clean the package database? [y/N] " -n 1 -r

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo pacman --noconfirm -Sc
    echo "Pacman cache cleaned."
  fi

}

# Yay Installation

install_yay() {
  if ! command -v yay &>/dev/null; then
    initial_dir="$PWD"

    git clone https://aur.archlinux.org/yay.git "$HOME/yay"
    cd "$HOME/yay"
    makepkg -sri

    cd "$initial_dir"
  fi
}

# Yay Package Installation

install_yay_packages() {
  yay -S --needed --noconfirm - <yay-pkglist.txt

  read -p "Do you want to clean the package database? [y/N] " -n 1 -r

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    yay --noconfirm -Sc
    echo "Yay cache cleaned."
  fi

}

# Dot Files Cloning

clone_dot_files() {
  for dir in "./dots/.config"/*; do
    [[ ! -d "$dir" ]] && continue

    dirname=$(basename "$dir")

    cp -r "$dir" "$HOME/.config/"
  done
}

install_fonts() {
  if [ ! -d "~/.local/share/fonts" ]; then
    mkdir -p ~/.local/share/fonts
  fi

  cp -r ./assets/fonts/. ~/.local/share/fonts/

  fc-cache -fv
}

install_wallpapers() {
  if [ ! -d "~/.local/share/wallpapers" ]; then
    mkdir -p ~/.local/share/wallpapers/
  fi

  cp -r ./assets/wallpapers/. ~/.local/share/wallpapers/

}

ask_for_system_reboot() {

  read -p "Do you want to reboot the system now? [y/N] " confirm

  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    sudo reboot
  fi
}

install_pacman_packages
install_yay
install_yay_packages
install_fonts
install_wallpapers
clone_dot_files
ask_for_system_reboot
