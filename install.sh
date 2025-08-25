#!/bin/bash
# Comprehensive setup script for a new machine

# Function to print colored headings
print_header() {
    echo -e "\n\e[1;34m$1\e[0m"
}

# --- 0. Ask for sudo password upfront ---
print_header "Requesting sudo access..."
sudo -v
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# --- 1. Package Installation ---
install_packages() {
    print_header "Installing APT packages..."
    sudo apt-get update
    sudo apt-get install -y zsh curl wget git fzf command-not-found tilix trash-cli arandr ssh-askpass htop
    sudo apt-get install -y unzip # Needed for fonts

    # Fix for command-not-found if it fails
    if ! command -v command-not-found &> /dev/null; then
        sudo apt-get install --reinstall command-not-found
    fi
}

# --- 2. Font Installation ---
install_fonts() {
    print_header "Installing Nerd Fonts (Agave)..."
    FONT_DIR="$HOME/.local/share/fonts"
    mkdir -p "$FONT_DIR"
    wget -O /tmp/Agave.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Agave.zip
    unzip -o /tmp/Agave.zip -d "$FONT_DIR/AgaveNerdFont"
    rm /tmp/Agave.zip
    echo "Updating font cache..."
    fc-cache -f -v
}

# --- 3. Frameworks & Tools Installation ---
install_frameworks() {
    print_header "Installing Oh My Zsh..."
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    else
        echo "Oh My Zsh is already installed."
    fi

    print_header "Installing Antigen..."
    # The user's .zshrc should contain the logic to source and use antigen.
    # This just ensures the directory for clones exists.
    mkdir -p "$HOME/.antigen"
    curl -L git.io/antigen > "$HOME/.antigen/antigen.zsh"

    print_header "Installing NVM (Node Version Manager)..."
    export NVM_DIR="$HOME/.nvm"
    if [ ! -d "$NVM_DIR" ]; then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    else
        echo "NVM is already installed."
    fi

    # Add tfenv installation
    print_header "Installing tfenv (Terraform Version Manager)..."
    if [ ! -d "$HOME/.tfenv" ]; then
        git clone https://github.com/tfutils/tfenv.git "$HOME/.tfenv"
        # Create symlinks in /usr/local/bin
        sudo ln -sf "$HOME/.tfenv/bin/"* /usr/local/bin
        echo "tfenv installed and symlinks created in /usr/local/bin."
    else
        echo "tfenv is already installed."
    fi
}

# --- 4. Symbolic Linking & Config Loading ---
setup_configs() {
    print_header "Creating symbolic links and loading configs..."
    DOTFILES_DIR=~/dotfiles

    # --- Zsh, Git, etc. ---
    # The Oh My Zsh installer creates a .zshrc, so we overwrite it with our symlink
    ln -sfv "$DOTFILES_DIR/.zshrc" ~
    ln -sfv "$DOTFILES_DIR/.p10k.zsh" ~
    ln -sfv "$DOTFILES_DIR/.gitconfig" ~

    # --- Arandr ---
    mkdir -p ~/.screenlayout
    ln -sfv "$DOTFILES_DIR/.screenlayout/"* ~/.screenlayout
    mkdir -p ~/.local/share/applications
    ln -sfv "$DOTFILES_DIR/.local/share/applications/"*screen*.desktop ~/.local/share/applications

    # --- Tilix ---
    echo "Loading Tilix configuration..."
    if [ -f "$DOTFILES_DIR/tilix/tilix.dconf" ]; then
        dconf load /com/gexperts/Tilix/ < "$DOTFILES_DIR/tilix/tilix.dconf"
    else
        echo "Tilix dconf file not found."
    fi
}

# --- Main Execution ---
install_packages
install_fonts
install_frameworks
setup_configs

echo -e "\n\e[1;32mInstallation complete! Please restart your terminal or log out and back in for all changes to take effect. Remember to switch to X11 desktop on Ubuntu.\e[0m"
