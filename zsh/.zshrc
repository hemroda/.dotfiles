
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
plugins=(git rbenv tmux)

source $ZSH/oh-my-zsh.sh

ZSH_TMUX_AUTOSTART='true'

# ----------------------------------------------------------------------- #
# Aliases
# ----------------------------------------------------------------------- #
source ~/.dotfiles/zsh/.aliases


# ----------------------------------------------------------------------- #
# EXPORTS
# ----------------------------------------------------------------------- #
PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

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

  export CFLAGS="-Wno-error=implicit-function-declaration"
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix libyaml) --with-zlib-dir=$(brew --prefix zlib)"
fi


export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
