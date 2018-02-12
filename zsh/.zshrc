# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/brinon/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="agnoster"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
plugins=(git docker github osx pip python )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
#
export VIM8='/usr/local/Cellar/vim/8.0.1200/bin/vim'
export MACVIM='/Applications/MacVim.app/Contents/bin/mvim'
export EDITOR="nvim"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias imgcat="sh ~/Repos/imgcat/imgcat.sh"

# added by Anaconda2 4.3.0 installer
export PATH="/Users/brinon/anaconda2/bin:$PATH"
export PYTHONPATH="/Users/brinon/crowdAI/inca:$PYTHONPATH"


# some alias
# python
alias py="python"
alias ipy="ipython"
alias incaenv="source activate inca-env"
alias incapy="docker-compose -f ~/crowdai/inca/docker-compose.yml run --rm inca-tasks python"
alias incaipy="docker-compose -f ~/crowdai/inca/docker-compose.yml run --rm inca-tasks ipython"

# docker-compose
alias docker_stop_all='docker stop $(docker ps -a -q)'
alias docker_rm_all='docker rm $(docker ps -a -q)'
alias docker_rm_imgs='sudo docker rmi $(sudo docker images -q)'

alias dc="docker-compose"
alias dcdown="docker-compose down"
alias dcup="docker-compose up"
alias dcbuild="docker-compose build"
alias dcreload="docker-compose down && docker-compose up"

function dcrun() {
  docker-compose run --rm "$@"
}

# random usefull
alias reload="source ~/.zshrc"
alias myip="curl ipinfo.io/ip"
alias inca="cd ~/crowdai/inca"

# editor
alias vim="nvim"
#alias vim="$MACVIM"

# inca
alias inca_test="docker-compose run --rm inca-tasks python -m unittest discover -v inca/t/unit/"
alias inca_lint="docker-compose run --rm inca-tasks python inca/unit_tests/test_lint.py"


# ssh agent
eval $(ssh-agent -s)
ssh-add -A -K

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end



# github
export HOMEBREW_GITHUB_API_TOKEN="1bb6dff06efef0344f64f21aa7c1595fff86327d"

# crowdAI ssh
export VAULT_ADDR='https://vault.crowdai.com'
export CROWDAI_KEY_NAME=crowdai_rsa
export PATH="/Users/brinon/crowdAI/ssh-crowdai/bin:$PATH"

alias sshc="ssh-crowdai -i ~/.ssh/$CROWDAI_KEY_NAME"



export GOPATH=/Users/brinon/Repos/Go


alias ...=../..
export PATH="/usr/local/opt/curl/bin:$PATH"

inca-pdb() {
    docker-compose -f ~/crowdai/inca/docker-compose.yml exec $1 bash -c "sleep 0.1 && rlwrap nc ${3:-127.0.0.1} ${2:-4444}"
}
