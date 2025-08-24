# My Dotfiles

A collection of my personal configuration files (dotfiles). This repository helps me quickly set up a new machine with my preferred settings.

## What's Inside?

This repository contains configurations for the following tools:

-   **Zsh**:
    -   `.zshrc`: Main configuration file for the Zsh shell.
    -   `.p10k.zsh`: Theme configuration for the Powerlevel10k prompt.
-   **Git**:
    -   `.gitconfig`: Global Git configuration (user, aliases, etc.).
-   **Arandr**:
    -   Screen layout scripts located in `/.screenlayout/`.
    -   `.desktop` shortcuts in `/.local/share/applications/` to launch layouts from an app menu.
-   **Visual Studio Code**:
    -   `vscode/settings.json`: User settings for the editor.

## Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/jtrivino95/dotfiles.git ~/dotfiles
    ```

2.  **Run the installation script:**
    The `install.sh` script will create symbolic links from your home directory to the configuration files in this repository.
    ```bash
    cd ~/dotfiles
    ./install.sh
    ```

## How It Works

This setup uses symbolic links (`symlinks`) to link the files from this repository to their actual locations (e.g., `~/.zshrc` is a link to `~/dotfiles/.zshrc`). This means you can edit the files in their normal locations, and the changes will be saved directly in this repository, ready to be committed.
