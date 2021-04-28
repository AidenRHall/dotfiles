export PROMPT='%/ %# '
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
setopt appendhistory extendedglob

unsetopt beep
# Disable default ctrl-s functionality so vim can save files with it instead
stty -ixon -ixoff 2>/dev/null

# use vim keybindings and editor
bindkey -v
export EDITOR='vim'

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^F' history-beginning-search-backward

# designed to work with xfree 4 keyboard settings
bindkey "\\E[1;5D" backward-word
bindkey "\\E[1;5C" forward-word

zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit colors
compinit
colors

# must insert this to make tab completion not destroy spacing
export LC_ALL="en_US.UTF-8"

export TERM="xterm-256color"

if [ -f ~/.zshrc_local ]; then
    . ~/.zshrc_local
fi

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -f ~/.aliases_local ]; then
    . ~/.aliases_local
fi
