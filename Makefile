all: sync

sync:
	@echo "Creating folders.."
	mkdir -p ~/.config/alacritty
	mkdir ~/Sites
	mkdir ~/.nvm

	@echo "Symlinking files..."
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.aliases ] || ln -s $(PWD)/aliases ~/.aliases
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.gitignore ] || ln -s $(PWD)/gitignore ~/.gitignore

	# don't show last login message
	touch ~/.hushlogin

	git config --global core.excludesfile $HOME/.gitignore

	source ~/.zshrc

clean:
	@echo "Cleaning up..."
	rm -f ~/.zshrc
	rm -f ~/.aliases
	rm -f ~/.vimrc
	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.gitconfig
	rm -f ~/.gitignore

.PHONY: all clean sync
