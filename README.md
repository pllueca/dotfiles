# dotfiles
My dotfiles

# Install

## NeoVim
```bash
# OSX
brew install neovim

# Ubuntu
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz && rm nvim-linux64.tar.gz
echo "export PATH=$PATH:~/nvim-linux64/bin" >> .bashrc


# Install NeoBundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh && rm ./install.sh

cd ~
git clone https://github.com/Brinon/dotfiles.git
ln -s ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/neovim/crowdai.vim ~/.config/nvim/crowdai.vim
```

## tmux

```bash
ln -s -f ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s -f ~/dotfiles/tmux/tmux.conf.local ~/.tmux.conf.local
```

## ZSH
* Ubuntu
```bash
sudo apt-get update && sudo apt-get -y install zsh

# make zsh default shell
chsh -s /bin/zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```


