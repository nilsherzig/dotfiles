########## SHELL ENV THINGS ##########
# rest lives in ~/.config/environment.d/
eval `keychain -q --eval work`
export EDITOR="nvim"
export KUSTOMIZE_PLUGIN_HOME=/opt/kustomize/

alias vi="nvim"
alias vim="nvim"
alias lg="lazygit"
alias k="kubectl"
alias ai="aichat -r default"
alias cd="z"

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
source <(fzf --zsh)

########## GRML PROMPT MODS ##########
# needs kube-ps1 installed

# --- KUBERNETES CONTEXT ---
KUBE_PS1_SYMBOL_CUSTOM="img"
KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_SEPARATOR=""
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=" "
KUBE_PS1_SYMBOL_PADDING=true
source '/opt/kube-ps1/kube-ps1.sh'
function prompt_kube_ps1() {
  REPLY=$(kube_ps1)
}
grml_theme_add_token kube-context -f prompt_kube_ps1 '%F{cyan}' '%f'


# --- vcs config ---
zstyle ':vcs_info:*' formats '%F{magenta}[%F{green}%b%F{magenta}]%f ' 'zsh: %r'

# --- final prompt layout ---
zstyle ':prompt:grml:left:setup' items change-root path vcs kube-context time newline rc percent 


########## EXTENSIONS ##########

source /usr/share/wikiman/widgets/widget.zsh

########## GIT THINGS ##########

alias gcm="git commit -am"
alias gs="git status"
