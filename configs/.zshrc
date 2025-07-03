eval "$(starship init zsh)"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY

export KUSTOMIZE_PLUGIN_HOME=/opt/kustomize/


eval "$(zoxide init zsh)"
source <(fzf --zsh)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# eval "$(bw completion --shell zsh); compdef _bw bw;"

export EDITOR="nvim"

alias cd="z"
alias vim="nvim"
alias vi="nvim"
alias lg="lazygit"
alias k="kubectl"
alias la="ls -al"


# if [ -x /usr/bin/dircolors ]; then
#   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias yay='yay --color=auto'
alias egrep='egrep --color=auto'


zstyle ':autocomplete:async' enabled no
# zstyle ':autocomplete:*' delay 1.0  # seconds (float)
# zstyle ':autocomplete:*' min-input 3
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
bindkey              '^I' menu-select
bindkey "$terminfo[kcbt]" menu-select

bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete
