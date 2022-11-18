.dotfiles
===


## Install xcode
`xcode-select --install`


## Setup git
`chmod +x git_setup.sh`  
`./git_setup.sh` 


## Install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


## Symlink files to appropriate places
`make`


## Install homebrew
`chmod +x homebrew.sh`  
`./homebrew.sh`


## Install all apps using brew
brew bundle

