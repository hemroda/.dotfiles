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

        export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
        export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
        export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"

        export PATH="$PATH:/Users/$USER/.asdf/installs/python/3.13.4/bin"

        export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@3)"
        
        # Java
        export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
        export CPPFLAGS="-I/opt/homebrew/opt/openjdk@21/include"
    fi

    # Intel i386 architecture configurations
    if [ "$(uname -m)" = "i386" ]; then

        echo "Running Zsh in i386 architecture"
        # homebrew
        eval "$(/usr/local/homebrew/bin/brew shellenv)"
        alias brew='/usr/local/homebrew/bin/brew'

        # EXPORTS
        export PATH="/usr/local/sbin:$PATH"
        export PATH="$HOME/.asdf/shims:$PATH"

        export PATH="/usr/local/opt/openssl@3/bin:$PATH"
        export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
        export CPPFLAGS="-I/usr/local/opt/openssl@3/include"
        export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"

        export PATH="/usr/local/opt/postgresql@17/bin/psql:$PATH"
    fi
fi
