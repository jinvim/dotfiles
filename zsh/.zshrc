# If you come from bash you might have to change your $PATH.
#
# export TERM="xterm-256color"
# [[ -n $TMUX ]] && export TERM="screen-256color" export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=/Applications/StataNow/StataMP.app/Contents/MacOS:$PATH

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export GDK_BACKEND=wayland

export EDITOR=$(which nvim)
export PATH=$HOME/go/bin:$PATH

if [[ $(uname -m) == 'arm64' ]]; then
  export PATH=/opt/homebrew/bin:$PATH
  export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig"
  export ARCHFLAGS="-arch arm64"
  export QUARTO_PYTHON="/opt/homebrew/bin/python3"
  export RETICULATE_PYTHON="/opt/homebrew/bin/python3"
  export XDG_CONFIG_HOME="$HOME/.config"
fi

source $HOME/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle jeffreytse/zsh-vi-mode

# Tell Antigen that you're done.
antigen apply

# save list of dirs
setopt autopushd


ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
plugins=()

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias e=nvim
alias lg=lazygit
alias c=z
alias ci=zi
alias l="eza -l --group-directories-first --icons"
## mkdir & change directory
function mc {
  mkdir -p $1
  cd $1
}
alias h="cd $HOME"
alias s="source $HOME/.zshrc"
alias f=spf

# tmux
alias tm=tmux
alias ta="tmux attach -t"
alias tl="tmux list-sessions"

# docker
alias dd="docker compose down"
alias du="docker compose up -d"
alias dl="docker container ls"
alias dnl="docker network ls"
alias dp="docker compose pull"


# language specific
alias python=python3
alias pip=pip3

alias cr="cargo run"
alias cb="cargo build"
alias cbr="cargo build --release"
alias ct="cargo test"
alias cn="cargo new"
alias cnn="cargo new --vcs none"

export HOMEBREW_NO_AUTO_UPDATE=true
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/leejin/.cache/lm-studio/bin"

# spf cd on quit
spf() {
    os=$(uname -s)

    # Linux
    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
    fi

    # macOS
    if [[ "$os" == "Darwin" ]]; then
        export SPF_LAST_DIR="$HOME/Library/Application Support/superfile/lastdir"
    fi

    command spf "$@"

    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
}
