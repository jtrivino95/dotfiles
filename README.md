# My Dotfiles

A collection of my personal configuration files (dotfiles). This repository helps me quickly set up a new machine with my preferred settings.

## What's Inside?

This repository contains configurations for the following tools:

-   **Zsh**: Main configuration via `.zshrc`.
-   **Oh My Zsh**: Installed automatically.
-   **Antigen**: Zsh plugin manager, installed automatically.
-   **Powerlevel10k**: Theme configuration via `.p10k.zsh`.
-   **Git**: Global configuration via `.gitconfig`.
-   **Arandr**: Screen layout scripts (e.g., `2-laptop-screen.sh`) and associated `.desktop` shortcuts.
-   **Tilix**: Terminal emulator profiles, stored in `tilix/`.
-   **NVM**: Node Version Manager.
-   **Fonts**: Installs the Agave Nerd Font.

## Installation

The installation is automated via a single script.

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/jtrivino95/dotfiles.git ~/dotfiles
    ```

2.  **Run the installation script:**
    The script will ask for your password upfront to install system packages.
    ```bash
    cd ~/dotfiles
    ./install.sh
    ```

## What the Script Does

1.  **Installs Packages**: Uses `apt-get` to install `zsh`, `curl`, `git`, `fzf`, `tilix`, `trash-cli`, `arandr`, and `command-not-found`.
2.  **Installs Fonts**: Downloads and installs the Agave Nerd Font.
3.  **Installs Frameworks**: Sets up Oh My Zsh, Antigen, and NVM.
4.  **Applies Configurations**: 
    -   Loads the Tilix profiles.
    -   Creates symbolic links for `.zshrc`, `.p10k.zsh`, `.gitconfig`, and Arandr scripts.

After running, restart your terminal or log out and back in for all changes to take effect.