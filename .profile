export BASHRC='~/.profile'
# aliases
alias la='ls -a'
alias ll='ls -l'
alias reload="source $BASHRC"
alias prof="vim $BASHRC"


force_color_prompt=yes
# Add git branch if its present to PS1
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#export PS1="\[\033[0;91m\]\w\[\033[0;30m\]\[\033[01;31m\]\n$(parse_git_branch)\[\033[00m\]\$ "
export PS1="\[\033[0;91m\]\w\[\033[0;30m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


export DEV="$HOME/Repos"
export DROPB="$HOME/Dropbox"
export UNI="$DROPB/UNI"
export SCRIPTS="$DEV/scripts"
export GOPATH="$HOME/gocode"
export GOBIN="${GOPATH}/bin"
export JULIAPATH="/Applications/Julia-0.3.8.app/Contents/Resources/julia/bin"
export SWIPLPATH="/Applications/SWI-Prolog.app/Contents/swipl/bin/x86_64-darwin13.1.0" 
export MYBIN="/Users/brinon/bin"
export PATH="${GOBIN}:${JULIAPATH}:${MYBIN}:$SCRIPTS:/opt/local/bin:/opt/local/sbin:$PATH"

# Setting PATH for Python 3.4
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# added by Anaconda 2.3.0 installer
export PATH="/Users/brinon/anaconda/bin:$PATH"
export PYTHONPATH="/Users/brinon/crowdAI/inca:$PYTHONPATH"

# KERAS
KERAS_BACKEND=tensorflow

# protoc
export PATH="/Users/brinon/protoc-3.1.0-osx-x86_64/bin":$PATH

# gdal
export PATH="/Library/Frameworks/GDAL.framework/Programs":$PATH
export PATH="/Library/Frameworks/GDAL.framework/Headers":$PATH 


# added by Anaconda2 4.3.0 installer
export PATH="/Users/brinon/anaconda/bin:$PATH"
export TEST=aa
