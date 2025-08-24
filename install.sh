#!/bin/bash
# This script creates symlinks for all dotfiles in this repository.

DOTFILES_DIR=~/dotfiles

echo "Creating symlinks for dotfiles..."

# Zsh, Git, etc.
ln -sfv "$DOTFILES_DIR/.zshrc" ~
ln -sfv "$DOTFILES_DIR/.p10k.zsh" ~
ln -sfv "$DOTFILES_DIR/.gitconfig" ~

# Arandr
echo "Setting up Arandr..."
mkdir -p ~/.screenlayout
ln -sfv "$DOTFILES_DIR/.screenlayout/"* ~/.screenlayout
mkdir -p ~/.local/share/applications
ln -sfv "$DOTFILES_DIR/.local/share/applications/"*screen*.desktop ~/.local/share/applications

# VS Code
echo "Setting up VS Code..."
mkdir -p ~/.config/Code/User
# The vscode/settings.json file is not yet in the repo, this line is ready for when it is.
# ln -sfv "$DOTFILES_DIR/vscode/settings.json" ~/.config/Code/User/settings.json

echo "Dotfiles symlinked successfully."
