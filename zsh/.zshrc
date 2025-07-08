if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -f ~/.private_aliases ]; then
    . ~/.private_aliases
fi

# Remove the message "Last login: [timestamp]" that appears when you open a terminal session.
touch ~/.hushlogin

# Disable the compfix warning
export ZSH_DISABLE_COMPFIX=true

# Set default editor
export EDITOR="vim"


# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #
# MACOS #
# ----------------------------------------------------------------------- #
# ----------------------------------------------------------------------- #
if [[ "$(uname)" == "Darwin" ]]; then
    # ARM architecture configurations
    if [[ "$(uname -m)" == "arm64" ]]; then
        echo "Running Zsh on an ARM architecture"

        # homebrew
        eval "$(/opt/homebrew/bin/brew shellenv)"

        eval "$(starship init zsh)"

        # EXPORTS
        export PATH="$HOME/.local/bin:$PATH"
        export PATH="$HOME/.asdf/shims:$PATH"

        # asdf initialization
        . /opt/homebrew/opt/asdf/libexec/asdf.sh

        PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

        export PATH="/opt/homebrew/opt/postgresql@14/bin:$PATH"
        export LDFLAGS="-L/opt/homebrew/opt/postgresql@14/lib"
        export CPPFLAGS="-I/opt/homebrew/opt/postgresql@14/include"

        export PATH="$PATH:/Users/hemroda/.asdf/installs/python/3.13.2/bin"
    fi

    # Intel i386 architecture configurations
    if [ "$(uname -m)" = "i386" ]; then

        echo "Running Zsh in i386 architecture"
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

        export PATH="/usr/local/opt/postgresql@14/bin/psql:$PATH"
    fi
fi
