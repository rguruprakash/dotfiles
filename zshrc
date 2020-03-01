# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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
)

source $ZSH/oh-my-zsh.sh

# Custom prompt config
function node_prompt_version {
    if which node &> /dev/null; then
        echo "%{$fg_bold[blue]%}node(%{$fg[red]%}$(node -v)%{$fg[blue]%}) %{$reset_color%}"
    fi
}
function yarn_prompt_version {
    if which node &> /dev/null; then
        echo "%{$fg_bold[blue]%}yarn(%{$fg[red]%}$(yarn -v)%{$fg[blue]%}) %{$reset_color%}"
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
    PROMPT='$(virtualenv_prompt_info)%{[03m%}%{$fg[green]%}%c $(git_prompt_info)$(k8s_prompt) $(node_prompt_version) $(yarn_prompt_version) ${newline}%{$fg[red]%}%(!.#.»)%{$reset_color%} '
}
build_prompt

# autojump config
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# kubectl config
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

# java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home"
export PYTHON2_HOME="/usr/local/Cellar/python@2/2.7.16"
export PYTHON3_HOME="/usr/local/Cellar/python/3.7.3"
export PATH=$PYTHON2_HOME:$PYTHON3_HOME:$JAVA_HOME/bin/java:$PATH

# Aliases
# TIP: Use \vi to ignore the alias and open the actual vi
alias vim="nvim"
alias vi="nvim"
alias vimconfig="vi ~/.vimrc"
alias zshconfig="vi ~/.zshrc"
alias tmux="TERM=screen-256color-bce tmux"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
