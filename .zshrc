# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt append_history
setopt share_history 
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Environment variables
export EDITOR=nvim
export VISUAL=nvim
export GIT_EDITOR=nvim
export QT_QPA_PLATFORMTHEME=qt5ct
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Load plugins
source ~/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.local/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.local/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.local/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Set up and load NVM (Node Version Manaber)
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  source "$NVM_DIR/nvm.sh"
fi

# Set up GVM (Go Version Manager)
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Set up pnpm
export PNPM="$HOME./local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Set up Starship
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship.toml
export FUNCNEST=1000
eval "$(starship init zsh)"

# Set up fzf
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS='--style full --layout reverse --color=hl:#ff9e64,info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff,marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

# Set up zoxide
eval "$(zoxide init --cmd zo zsh)"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle :compinstall filename '~/.zshrc'

# Load completion
autoload -Uz compinit && compinit

# Set vi-mode
bindkey -v
KEYTIMEOUT=1

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Disable paste highlighting
zle_highlight+=(paste:none)

# Aliases
alias v="nvim"
alias g="git"
alias k="kubectl"
alias ls="ls --color=auto"
alias l="ls -la"
alias t="~/.local/bin/tmux-sessionizer"
alias hdmi1="xrandr --output eDP-1 --off --output HDMI-1 --primary --mode 3440x1440 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-2 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off"
alias edp1="xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output HDMI-2 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off"
alias both="xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-2 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off"
alias chulavpn="sudo openconnect --protocol=anyconnect vpn.chula.ac.th --user 6330261921"

# Terminal title
case "$TERM" in (rxvt|rxvt-*|st|st-*|*xterm*|(dt|k|E)term)
  local term_title () { print -n "\e]0;${(j: :q)@}\a" }
  precmd () {
    local DIR="$(print -P '[%c]%#')"
    term_title "$DIR" "zsh"
  }
  preexec () {
    local DIR="$(print -P '[%c]%#')"
    local CMD="${(j:\n:)${(f)1}}"
    term_title "$DIR" "$CMD"
  }
;;
esac
