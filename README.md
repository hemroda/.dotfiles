# .dotfiles

## For Debian

### Generate SSH key and add it to Github or Gitlab

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

```bash
eval "$(ssh-agent -s)"
```

```bash
cat ~/.ssh/id_ed25519.pub
```
### Install stow

```sh
sudo apt install stow
```

### Clone dotfiles repo

```sh
sudo apt install git
```

```bash
cd && git clone https://gitlab.com/hemroda/dotfiles.git
```

### Make sure the `_debian` file is executable

```bash
chmod +x _debian
```

### Run Installation script

```bash
./_debian
```

## For MacOS

### install Xcode Command Line Tools

```bash
xcode-select --install
```
In case Xcode installation is not working, install homebrew:
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Clone dotfiles repo

```bash
$ cd && git clone https://gitlab.com/hemroda/dotfiles.git
```

### Generate SSH key and add it to Github or Gitlab

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

```bash
eval "$(ssh-agent -s)"
```

```bash
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

```bash
pbcopy < ~/.ssh/id_ed25519.pub
```

### Make sure the `_macos` file is executable

```bash
chmod +x _macos
```

### Run Installation script

```bash
$ ./_macos
```


