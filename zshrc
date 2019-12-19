# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source zplugin
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# Load plugins first
zplugin ice depth=1; zplugin light romkatv/powerlevel10k
zplugin snippet https://github.com/sainnhe/dotfiles/blob/master/.zsh-theme-gruvbox-material-dark

# Export zlib
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

# Add sitefunctions to ZPATH (alacritty completions install in here)
fpath=(~/.config/zsh/functions $fpath)

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# Set language environment
export LANG=en_GB.UTF-8

# Set editor
export EDITOR='vim'

# Aliases
alias gb="git br"
alias gc="git commit"
alias gco="git co"
alias gl="git l"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gs="git st"
alias tls="tmux ls"
alias ta="tmux attach-session -t"
alias tn="tmux new -s"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

