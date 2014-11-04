HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory extendedglob
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/aiden/.zshrc'

autoload -Uz compinit vcs_info colors
compinit
colors

zstyle ":vcs_info:*" enable git hg
zstyle ':vcs_info:git*' formats ":%{$fg[blue]%}%b%{$reset_color%}"
zstyle ':vcs_info:hg*' formats ":%{$fg[blue]%}%b%{$reset_color%}"
precmd () {
    vcs_info
}

setopt prompt_subst
PROMPT='%{$fg[green]%}%1~%{$reset_color%}${vcs_info_msg_0_} %# '

export GOPATH=/home/aiden/src/gocode
export PATH=$PATH:$GOPATH/bin

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
