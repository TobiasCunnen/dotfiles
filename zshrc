eval "$(starship init zsh)"

if [[ ! -e ~/.zsh/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi

if [[ ! -e ~/.zsh/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
fi

if [[ ! -e ~/.zsh/zsh-vi-mode ]]; then
  git clone https://github.com/jeffreytse/zsh-vi-mode.git ~/.zsh/zsh-vi-mode
fi

if [[ ! -e ~/.zsh/zsh-history-substring-search ]]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.zsh/zsh-history-substring-search
fi

if [[ ! -e ~/.zsh/z ]]; then
  git clone https://github.com/skywind3000/z.lua.git ~/.zsh/z
fi

autoload -Uz compinit
compinit

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-vi-mode/zsh-vi-mode.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
eval "$(lua ~/.zsh/z/z.lua --init zsh enhanced once fzf)"

# Add vim keybindings to substring search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Aliases
alias e='nvim'
