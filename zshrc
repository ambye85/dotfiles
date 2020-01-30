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
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix gnu-sed)/libexec/gnubin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
PYTHON_VERSION=3.8.0

# Go
export PATH="$PATH:/usr/local/go/bin"

# Set language environment
export LANG=en_GB.UTF-8

# Set editor
export EDITOR='vim'

# Aliases
alias reload="source ~/.zshrc"
alias a="source venv/bin/activate"
alias d="deactivate"
alias mkenv="pyenv local $PYTHON_VERSION && python -m venv venv"
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
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( virtualenv dir vcs )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( status command_execution_time background_jobs custom_rprompt context )

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

