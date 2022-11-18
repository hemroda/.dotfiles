if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # ----------------------------------------------------------------------- #
  # ----------------------------------------------------------------------- #
  # KALI
  # ----------------------------------------------------------------------- #
  # ----------------------------------------------------------------------- #

else
  # ----------------------------------------------------------------------- #
  # ----------------------------------------------------------------------- #
  # MACOS
  # ----------------------------------------------------------------------- #
  # ----------------------------------------------------------------------- #

  # Aliases
  # ----------------------------------------------------------------------- #
  source ~/.aliases


  # EXPORTS
  # ----------------------------------------------------------------------- #
  export EDITOR="vim"
  PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
  
  # oh-my-zsh
  # ----------------------------------------------------------------------- #
  export ZSH="$HOME/.oh-my-zsh"
  plugins=(git)
  source $ZSH/oh-my-zsh.sh

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
    export EDITOR="vim"
    export BUNDLER_EDITOR=vim
  fi

  eval "$(starship init zsh)"

  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

  export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh"  ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi
