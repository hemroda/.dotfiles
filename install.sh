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

