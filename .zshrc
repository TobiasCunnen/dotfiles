source ~/.profile

eval "$(starship init zsh)"

export EDITOR=nvim
# Zsh history settings
HISTFILE=~/.histfile

# Make the history file realy realy REALY big
HISTSIZE=1000000000
SAVEHIST=1000000000

setopt HIST_EXPIRE_DUPS_FIRST  # Expire dup event first when trimming hist
setopt HIST_FIND_NO_DUPS       # Do not display previously found event
setopt HIST_IGNORE_ALL_DUPS    # Delete old event if new is dup
setopt HIST_IGNORE_DUPS        # Do not record consecutive dup events
setopt HIST_SAVE_NO_DUPS       # Do not write dup event to hist file

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

export TERM=xterm-256color

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-vi-mode/zsh-vi-mode.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
eval "$(lua ~/.zsh/z/z.lua --init zsh enhanced once fzf)"

# Add vim keybindings to substring search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# VI mode settings
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

# Aliases
alias e='nvim'
alias nix-install='nix-env -iA nixpkgs.tcunnenPackages'
alias dc='docker compose'
alias pc='podman-compose'
alias t='zellij'
alias show="kitten icat"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

