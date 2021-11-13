# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# Allow to switch directory quickly. Use d command.
setopt autocd autopushd pushdignoredups
# Suppress beep noise when error happen?
unsetopt beep
# Uncomment to enable vim mode
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ibnumalik/.zshrc'

# https://wiki.archlinux.org/title/zsh#Command_completion
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Autocomplete will expand lowercase to uppercase
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'
# For autocompletion with an arrow-key driven interface, add the following to:
zstyle ':completion:*' menu select

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export FZF_DEFAULT_COMMAND='fd --type f'

# Use fd to generate the fzf list for directory completion
_fzf_compgen_dir() {
  fd --type d --follow --exclude ".git" . "$1"
}

# alias
alias sc="source $HOME/.zshrc"
alias el="exa -la"
alias elg="exa -la --group-directories-first"
alias path='echo $PATH | tr ":" "\n" | nl'
alias fpath='echo $FPATH | tr ":" "\n" | nl'
alias u="ultralist"
alias d='dirs -v | fzf'
alias sail='bash vendor/bin/sail'
alias dush="du -sh * | sort -h"

export GOPATH=$HOME/go

# path
JAVA_HOME='/usr/lib/jvm/java-8-openjdk/jre'
PATH=$JAVA_HOME/bin:$PATH
PATH=$PATH:$GOPATH/bin
PATH=/usr/share/dotnet:$HOME/.dotnet/tools:$PATH
PATH=$HOME/.config/composer/vendor/bin:$PATH
FPATH=$HOME/.completion.d:$FPATH

CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet

# Make QT app look like gnome app
export QT_QPA_PLATFORMTHEME='gnome'

# aws autocomplete
complete -C '/usr/bin/aws_completer' aws

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# run npm script (requires jq) / allow to pass args
fns() {
  local script
  script=$(cat package.json | jq -r '.scripts | keys[] ' | sort | fzf) && npm run $(echo "$script") "$@"
}

update_mirrorlist() {
  cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.`date +'%d%m%Y'`.bak
  reflector --country 'Singapore' --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
