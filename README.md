# My Dotfiles

This repository contains my personal configuration files (dotfiles) for various programs, managed to be easily portable to new installations.

## Contents

Currently, the repository includes:

### Arandr

*   **Repo Location:** `/.screenlayout/` and `/.local/share/applications/`
*   **Description:** Contains scripts for different screen configurations generated with Arandr and the `.desktop` files to launch them comfortably from an application menu.
*   **Available Profiles:**
    *   `laptop-only`: Laptop screen only.
    *   `2-screen`: Two-monitor setup.
    *   `3-screen`: Three-monitor setup.
    *   `main-screen`: Main external screen.

## Installation

To install these configurations on a new system, follow these steps.

1.  **Clone the repository to your home directory:**
    ```bash
    git clone https://github.com/jtrivino95/dotfiles.git ~/dotfiles
    ```

2.  **Create the symbolic links:**
    The following command will link the configuration files from the repository to the locations where the programs expect to find them.

    ```bash
    # Create destination directories if they don't exist
    mkdir -p ~/.screenlayout
    mkdir -p ~/.local/share/applications

    # Link Arandr scripts
    ln -s ~/dotfiles/.screenlayout/*.sh ~/.screenlayout/

    # Link shortcuts
    ln -s ~/dotfiles/.local/share/applications/*.desktop ~/.local/share/applications/
    ```

## Usage

Once installed, the screen profiles should appear in your desktop environment's application menu thanks to the `.desktop` files, allowing for a quick configuration change.