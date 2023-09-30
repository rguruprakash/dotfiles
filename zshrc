#If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=nvim

# Path to your oh-my-zsh installation.
export ZSH="/Users/grajakkannu/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="kennethreitz"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  kube-ps1
  autojump
  # zsh-autosuggestions
  zsh-syntax-highlighting
  # vi-mode
)

source $ZSH/oh-my-zsh.sh

# Custom prompt config
function node_prompt_version {
    if which node &> /dev/null; then
        echo "%{$fg_bold[blue]%}node(%{$fg[red]%}$(node -v)%{$fg[blue]%}) %{$reset_color%}"
    fi
}
# function yarn_prompt_version {
#     if which node &> /dev/null; then
#         echo "%{$fg_bold[blue]%}yarn(%{$fg[red]%}$(yarn -v)%{$fg[blue]%}) %{$reset_color%}"
#     fi
# }
function go_prompt_version {
    if which node &> /dev/null; then
        echo "%{$fg_bold[blue]%}go(%{$fg[red]%}$(go version | cut -d ' ' -f 3)%{$fg[blue]%}) %{$reset_color%}"
    fi
}
function python_prompt_version {
    if which node &> /dev/null; then
        echo "%{$fg_bold[blue]%}python(%{$fg[red]%}$(python -V | cut -d ' ' -f 2)%{$fg[blue]%}) %{$reset_color%}"
    fi
}
function k8s_prompt {
    if which node &> /dev/null; then
        echo "%{$fg_bold[blue]%}k8s%{$reset_color%}$(kube_ps1)"
    fi
}
function build_prompt {
    newline=$'\n'
    KUBE_PS1_SYMBOL_ENABLE=false
    VI_MODE_SET_CURSOR=true
    PROMPT='$(virtualenv_prompt_info)%{[03m%}%{$fg[green]%}%c $(git_prompt_info)$(k8s_prompt) $(node_prompt_version) $(go_prompt_version) $(python_prompt_version) ${newline}%{$fg[red]%}%(!.#.»)%{$reset_color%} '
}
build_prompt

# autojump config
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# kubectl config
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

# for pyenv to work properly
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Aliases
# TIP: Use \vi to ignore the alias and open the actual vi
# alias nvim="~/nvim-macos/bin/nvim"
alias vim="nvim"
alias vi="nvim"
alias vi-astro="NVIM_APPNAME=AstroNvim nvim"
alias vi-nvchad="NVIM_APPNAME=NvChad nvim"
# alias vi-lunar="NVIM_APPNAME=LunarNvim nvim"
alias vi-lazy="NVIM_APPNAME=LazyNvim nvim"
alias zshrc="vi ~/.zshrc"
alias yabairc="vi ~/.yabairc"
alias skhdrc="vi ~/.skhdrc"
alias spacebarrc="vi ~/.config/spacebar/spacebarrc"
# alias vimluaconfig="vi ~/.config/nvim/config/config.lua"
alias tmux="TERM=screen-256color-bce tmux"
alias air='$(go env GOPATH)/bin/air'
alias lg='lazygit'
alias lzd='lazydocker'
alias docker='podman'
alias docker-compose='podman-compose'

export DOCKER_HOST='unix:///Users/grajakkannu/.local/share/containers/podman/machine/qemu/podman.sock'
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/go/bin
PATH="$PATH:/Users/grajakkannu/.local/share/nvim/mason/bin" # <<< mason.nvim install directory <<<
# export JAVA_HOME=`/usr/libexec/java_home -v 17`  # <<< JVM <<<
[[ -s "/Users/grajakkannu/.gvm/scripts/gvm" ]] && source "/Users/grajakkannu/.gvm/scripts/gvm" 
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH
export PATH="/Users/grajakkannu/git/mask-credentials:$PATH"
