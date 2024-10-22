# Dotfiles

## For MacOS

### install Xcode Command Line Tools

```bash
xcode-select --install
```
In case Xcode installation is not working, install homebrew:
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
it will install Xcode.

## Clone dotfiles repo

```bash
cd && git clone git@github.com:hemroda/.dotfiles.git
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

### Make sure the `install` file is executable

```bash
chmod +x install
```

### Run Installation script

```bash
./install
```


## SSH key generator

```sh
make generate-ssh-key USER_NAME=root
```

```sh
make generate-ssh-key USER_NAME=kamal
```