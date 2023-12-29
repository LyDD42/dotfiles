export TERM='xterm-256color'

# options
setopt autocd
setopt auto_pushd

# history config
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# completion
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/lydd/.zshrc'

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

bindkey "^E" end-of-line
bindkey -M vicmd "^E" end-of-line

bindkey "^[[3~" delete-char
bindkey "^?" backward-delete-char

# <C-arrow>
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

bindkey -M vicmd "^[[A" history-beginning-search-backward
bindkey -M vicmd "^[[B" history-beginning-search-forward
bindkey -M vicmd "^P" history-beginning-search-backward
bindkey -M vicmd "^N" history-beginning-search-forward

# <Shift-TAB>
bindkey "^[[Z" reverse-menu-complete

# powerline 10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.alias
