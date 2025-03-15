export TERM='xterm-256color'

# options
setopt autocd
setopt auto_pushd

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# completion
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

zmodload zsh/complist

# key bindings
bindkey -v

# HOME END
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey -M vicmd "^[[H" beginning-of-line
bindkey -M vicmd "^[[F" end-of-line

# HOME END tmux
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey -M vicmd "^[[1~" beginning-of-line
bindkey -M vicmd "^[[4~" end-of-line

bindkey "^E" end-of-line
bindkey -M vicmd "^E" end-of-line

bindkey "^[[3~" delete-char
bindkey "^?" backward-delete-char

# <C-left/right arrow>
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# up/down arrow
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey -M vicmd "^[[A" history-beginning-search-backward
bindkey -M vicmd "^[[B" history-beginning-search-forward

# <C-P/N>
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey -M vicmd "^P" history-beginning-search-backward
bindkey -M vicmd "^N" history-beginning-search-forward

# <Shift-TAB>
bindkey "^[[Z" reverse-menu-complete

# unbind ^I for fzf-completion
bindkey -r "^I"
# zsh-autosuggestions
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
source <(fzf --zsh)

# fzf.git
source $HOME/.zsh/fzf-git.sh/fzf-git.sh

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh.json)"

source ~/.alias
