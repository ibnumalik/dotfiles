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
alias eld="exa -la -s=modified"
alias path='echo $PATH | tr ":" "\n" | nl'
alias fpath='echo $FPATH | tr ":" "\n" | nl' # FPATH The search path for function definitions.
alias u="ultralist"
alias d='dirs -v | fzf' # dirs command shell builtin is used to display the list of currently remembered directories
alias sail='bash vendor/bin/sail' # Laravel sail. Only can be used in Laravel project directory.
alias dush="du -sh * | sort -h" # List all files and directories size in human readable format.

export GOPATH=$HOME/go

# path
PATH=$PATH:$GOPATH/bin
PATH=$HOME/.config/composer/vendor/bin:$PATH
# https://unix.stackexchange.com/questions/33255/how-to-define-and-load-your-own-shell-function-in-zsh
FPATH=$HOME/.completion.d:$FPATH

# Make QT app look like gnome app
export QT_QPA_PLATFORMTHEME='gnome'

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

function powerline_precmd() {
    PS1="$(powerline-go -error $? -jobs $(jobs -p | wc -l) -hostname-only-if-ssh -cwd-mode dironly)"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ] && [ -x "$(command -v powerline-go)" ]; then
    install_powerline_precmd
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setup fnm node manager
eval "$(fnm env)"
