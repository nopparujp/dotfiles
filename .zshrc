HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

bindkey -v
KEYTIMEOUT=1

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

eval "$(starship init zsh)"

alias ls="ls --color=auto"
alias hdmi1="xrandr --output eDP-1 --off --output HDMI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-2 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off"
alias edp1="xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output HDMI-2 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off"
alias chulavpn="sudo openconnect --protocol=anyconnect vpn.chula.ac.th --user 6330261921"


export PATH=~/.cargo/bin:~/.local/bin:$PATH
export EDITOR=nvim
export VISUAL=nvim
export GIT_EDITOR=nvim
export QT_QPA_PLATFORMTHEME=qt5ct
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export WORKON_HOME=$HOME/.virtualenvs
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=hl:#ff9e64,info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff,marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"

source ~/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.local/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.local/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.local/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.local/bin/virtualenvwrapper.sh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

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

zvm_after_init_commands+=('bindkey -s "^f" "tmux-sessionizer\n"')
