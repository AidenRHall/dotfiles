HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt appendhistory extendedglob

unsetopt beep

bindkey -v
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^F' history-beginning-search-backward
bindkey "\^\[\[5D" backward-word
bindkey "\^\[\[5C" forward-word

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

_prompt_and_resched() { sched +1 _prompt_and_resched; zle && zle reset-prompt }
_prompt_and_resched

setopt prompt_subst
PROMPT=': %D{%H:%M:%S} %{$fg[green]%}%1~%{$reset_color%}${vcs_info_msg_0_} %# ; '

export GOPATH=/home/aiden/src/gocode
export PATH=$PATH:$GOPATH/bin


if [ -f ~/.zshrc_local ]; then
    . ~/.zshrc_local
fi

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -f ~/.aliases_local ]; then
    . ~/.aliases_local
fi
