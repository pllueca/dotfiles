# install homebrew
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -h zsh/.zshrc ~/.zshrc

# neovim installation
brew install neovim
mkdir -p ~/.config/nvim
ln -s nvim/init.vim ~/.config/nvim/init.vim

