#!/usr/bin/env bash

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export EDITOR="vim"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.asdf/shims:$PATH"
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

eval "$(starship init bash)"


# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #
# Linux - Fedora #
# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #
if [ -f /etc/os-release ]; then
    . /etc/os-release # Source the file to get variables like ID, NAME, etc.
    if [ "$ID" == "fedora" ]; then
        echo "Running Bash on Fedora"
        . "$HOME/.asdf/asdf.sh" # Assuming asdf setup for Fedora
        # Add any other Fedora-specific configurations here
        # For example:
        # export PATH="/usr/local/opt/fedora_specific_tool/bin:$PATH"
    fi
fi


# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #
# Linux - Debian #
# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #
if [ -f /etc/debian_version ]; then
  . "$HOME/.asdf/asdf.sh"

  eval "$(starship init bash)"
fi


# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #
# MACOS #
# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #
# Get the operating system name
os=$(uname -s)

if [ "$os" == "Darwin" ]; then

    # ARM architecture configurations
    if [ "$(uname -p)" == "arm" ]; then
        echo "Running Bash on an ARM architecture"
        # asdf
        . /opt/homebrew/opt/asdf/libexec/asdf.sh

        # homebrew
        eval "$(/opt/homebrew/bin/brew shellenv)"

        # EXPORTS
        PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
        export PATH="$HOME/.asdf/shims:$PATH"

        export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
        export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
        export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"
    fi

    # Intel i386 architecture configurations
    if [ "$(uname -p)" = "i386" ]; then
        echo "Running Bash in i386 architecture"
        # homebrew
        eval "$(/usr/local/homebrew/bin/brew shellenv)"
        alias brew='/usr/local/homebrew/bin/brew'

        # EXPORTS
        PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
        export PATH="/usr/local/sbin:$PATH"
        export PATH="$HOME/.asdf/shims:$PATH"

        export PATH="/usr/local/opt/openssl@3/bin:$PATH"
        export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
        export CPPFLAGS="-I/usr/local/opt/openssl@3/include"
        export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"

        export PATH="/usr/local/opt/postgresql@17/bin/psql:$PATH"
    fi
fi
