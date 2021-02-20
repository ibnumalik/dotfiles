# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ibnumalik/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

powerline-daemon -q
. /usr/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# alias
alias sc="source $HOME/.zshrc"

alias el="exa -la"
alias elg="exa -la --group-directories-first"
alias path='echo $PATH | tr ":" "\n" | nl'
alias fpath='echo $FPATH | tr ":" "\n" | nl'
alias u="ultralist"

export GOPATH=$HOME/go

# path
PATH=$PATH:$GOPATH/bin
PATH=/usr/share/dotnet:$HOME/.dotnet/tools:$PATH
PATH=$HOME/.config/composer/vendor/bin:$PATH
FPATH=$HOME/.completion.d:$FPATH

# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet
