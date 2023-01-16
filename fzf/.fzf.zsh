# Setup fzf
# ---------
if [[ ! "$PATH" == */home/samaygandhi/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/samaygandhi/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/samaygandhi/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/samaygandhi/.fzf/shell/key-bindings.zsh"
