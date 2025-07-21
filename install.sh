#!/usr/bin/env bash

# Get the operating system name
os=$(uname -s)

echo "⏳ Setting up your $os..."


# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #
# MACOS #
# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #
if [[ "$os" == "Darwin" ]]; then
    echo "Running MacOS installations..."

    # Install Xcode Command Line Tools if not already installed
    if ! xcode-select -p &>/dev/null; then
      echo "Installing Xcode Command Line Tools..."
      xcode-select --install
      until xcode-select -p &>/dev/null; do
        sleep 5
      done
    fi

    # Install Homebrew if not already installed
    if ! command -v brew &>/dev/null; then
      echo "Installing Homebrew..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    # Install applications via Brewfile
    if [[ -f ./Brewfile ]]; then
      echo "Installing applications from Brewfile..."
      brew bundle --file=./Brewfile
    else
      echo "Warning: Brewfile not found in current directory"
    fi

    # Start few applications
    brew services start redis
    brew services start postgresql
fi


# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #
# LINUX - Debian & Fedora #
# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #
if [[ "$os" == "Linux" ]]; then
    if grep -qi 'ID=debian' /etc/os-release || grep -qi 'ID_LIKE=.*debian' /etc/os-release; then
        echo "Running Debian-based installations..."
        sudo apt-get install --no-install-recommends -y build-essential
        sudo apt-get install make build-essential libssl-dev zlib1g-dev
        sudo apt-get install libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm
        sudo apt-get install libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

        if [[ $(asdf --version) == "" ]]; then
         git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.16.5
        fi

        if [[ $(command -v 'starship') == "" ]]; then
         curl -sS https://starship.rs/install.sh | sh
        fi

        sudo apt install coreutils
        sudo apt install git
        sudo apt install neovim
    elif grep -qi 'ID=fedora' /etc/os-release || grep -qi 'ID_LIKE=.*fedora' /etc/os-release; then
        echo "Running Fedora-based installations..."
        # Your Fedora-specific commands here
    else
        echo "Unknown Linux distribution."
    fi
fi

# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #
# Shared #
# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #

# Install NodeJS, Python, and Ruby using ASDF
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 22.14.0
asdf global nodejs 22.14.0

asdf plugin add python https://github.com/asdf-community/asdf-python.git
asdf install python 3.13.4
asdf global python 3.13.4

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 3.4.3
asdf global ruby 3.4.3

# Folder for dev projects
mkdir ~/Sites

# Clean files and folders before stowing
rm ~/.bash_profile
rm ~/.bashrc
rm ~/.zshrc

# Symlinking using to stow
stow asdf
stow bash
stow config
stow git
stow languages
stow shared
stow ssh
stow vim
stow vscodium
stow zsh

# Optionally restart the shell
exec "$SHELL" -l
