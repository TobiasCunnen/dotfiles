
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -U path cdpath fpath manpath

for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

HELPDIR="/nix/store/sn59qaijwgpf8n41khl60mfnfbxyb16x-zsh-5.9/share/zsh/$ZSH_VERSION/help"




path+="$HOME/.zsh/plugins/powerlevel10k"
fpath+="$HOME/.zsh/plugins/powerlevel10k"
path+="$HOME/.zsh/plugins/zsh-history-substring-search"
fpath+="$HOME/.zsh/plugins/zsh-history-substring-search"
path+="$HOME/.zsh/plugins/zsh-vi-mode"
fpath+="$HOME/.zsh/plugins/zsh-vi-mode"

# Oh-My-Zsh/Prezto calls compinit during initialization,
# calling it twice causes slight start up slowdown
# as all $fpath entries will be traversed again.
autoload -U compinit && compinit

source /nix/store/kvml2f01igiv690pb192sjh3m2c4wmal-zsh-autosuggestions-0.7.0/share/zsh-autosuggestions/zsh-autosuggestions.zsh





if [[ -f "$HOME/.zsh/plugins/powerlevel10k/share/zsh-powerlevel10k/powerlevel10k.zsh-theme" ]]; then
  source "$HOME/.zsh/plugins/powerlevel10k/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"
fi
if [[ -f "$HOME/.zsh/plugins/zsh-history-substring-search/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]]; then
  source "$HOME/.zsh/plugins/zsh-history-substring-search/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
fi
if [[ -f "$HOME/.zsh/plugins/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.zsh" ]]; then
  source "$HOME/.zsh/plugins/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.zsh"
fi


# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY


eval "$(/nix/store/zvbqlyraffgawc3dv4pakp37vjhvqwc5-z-lua-1.8.16/bin/z --init zsh enhanced once fzf)"

if test -n "$KITTY_INSTALLATION_DIR"; then
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
  unfunction kitty-integration
fi


      bindkey -M vicmd 'k' history-substring-search-up 

      bindkey -M vicmd 'j' history-substring-search-down 

    

# Aliases
alias e='nvim'

# Named Directory Hashes


source /nix/store/zssic984hrqxzc5anrf5cyjh4xarlg57-zsh-syntax-highlighting-0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


