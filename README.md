# dotfiles
My dotfiles

# Install

## NeoVim
```bash
# OSX
brew install neovim

# Ubuntu
wgt https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
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
ln ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
```

