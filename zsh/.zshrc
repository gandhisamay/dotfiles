# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# Install the powerlevel10k from its github repo to use this
# source ~/powerlevel10k/powerlevel10k.zsh-theme
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Created by newuser for 5.8
# ZSH_THEME="robbyrussell"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export HISTSIZE=1000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
export LS_OPTIONS='--color=auto'
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"
export FZF_DEFAULT_OPS="--extended"
export PATH="${PATH}:${HOME}/.local/bin/"
export TESSDATA_PREFIX="$HOME/Documents/homoglyph_attack_detection/tesseract/"
# Change the node version to 16.15.0
source $HOME/.config/scripts/set_node_version.sh
source $HOME/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
# zsh-autocomplete 

eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'


setopt hist_ignore_all_dups
setopt hist_ignore_space

plugins=(zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[ '  autosuggest-accept


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias lg='lazygit'
