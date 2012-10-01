# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="alanpeabody"
ZSH_THEME="af-magic"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(debian ssh-agent git mercurial rake rbenv ruby thor)

source $ZSH/oh-my-zsh.sh
# Customize to your needs...
export PATH="$HOME/bin:$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"

alias tree="tree -FC --dirsfirst"

alias l='ls -la --group-directories-first'
alias ll='ls -l --group-directories-first'
alias la='ls -lah --group-directories-first'


if [ "x$OH_MY_ZSH_HG" = "x" ]; then
    OH_MY_ZSH_HG="hg"
fi
