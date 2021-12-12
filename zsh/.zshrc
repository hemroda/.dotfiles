
ZSH_DISABLE_COMPFIX=true

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rbenv)

source $ZSH/oh-my-zsh.sh


# ----------------------------------------------------------------------- #
# Aliases
# ----------------------------------------------------------------------- #
source ~/.dotfiles/zsh/.aliases


# ----------------------------------------------------------------------- #
# EXPORTS
# ----------------------------------------------------------------------- #
if [ "$(uname -p)" = "i386" ]; then
  echo "Running in i386 mode (Rosetta)"
  eval "$(/usr/local/homebrew/bin/brew shellenv)"
  alias brew='/usr/local/homebrew/bin/brew'

  export PATH="/usr/local/sbin:$PATH"

  export PATH="/usr/local/opt/openssl@3/bin:$PATH"
  export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl@3/include"
  export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"

  export PATH="/usr/local/opt/postgresql@14/bin/psql:$PATH"
else
  echo "Running in ARM mode (M1)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  alias brew='/opt/homebrew/bin/brew'

  export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
fi

