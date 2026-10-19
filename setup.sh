#!/bin/bash

set -e

if [[ $EUID -ne 0 ]]; then
  echo "Error: You must run this script as root."

  exit 1
fi

# Pacman Package Installation

install_pacman_packages() {
  pacman -Syu --noconfirm --needed - <pacman-pkglist.txt

  if [ $EUID -eq 0 ]; then
    read -p "Do you want to clean the package database? [y/N] " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      pacman --noconfirm -Sc
      echo "Package cache cleaned."
    fi
  fi
}

# Yay Installation

install_yay() {
  git clone https://aur.archlinux.org/yay.git "$HOME/yay"
  cd "$HOME/yay"
  makepkg -sri
}

# Yay Package Installation

install_yay_packages() {
  yay -S --noconfirm - <yay-pkglist.txt

  if [ $EUID -eq 0 ]; then
    read -p "Do you want to clean the package database? [y/N] " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      yay --noconfirm -Sc
      echo "Package cache cleaned."
    fi
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

install_pacman_packages
install_yay
install_yay_packages
clone_dot_files

# Reboot the system

if [ $EUID -eq 0 ]; then
  read -p "Do you want to reboot the system now? [y/N] " -n 1 -r
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    reboot
  fi
fi
