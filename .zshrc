# set -x
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
# End of lines added by compinstall

# Autocomplete will expand lowercase to uppercase
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'
# For autocompletion with an arrow-key driven interface, add the following to:
zstyle ':completion:*' menu select

# path
# path+=($HOME/.config/composer/vendor/bin)
# https://unix.stackexchange.com/questions/33255/how-to-define-and-load-your-own-shell-function-in-zsh
# export FPATH=$HOME/.completion.d:$FPATH
fpath+=($HOME/.zsh/completion)

# https://wiki.archlinux.org/title/zsh#Command_completion
# should autoload after fpath
autoload -Uz compinit
compinit -i

# why this is loaded? who load this? even when it is commented out
# export GOPATH=$HOME/go
# path+=($GOPATH/bin)
export PATH="$HOME/.local/bin:$PATH"

# fzf
if [ -d /usr/share/fzf ]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
  export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
  export FZF_DEFAULT_COMMAND='fd --type f'

  # Use fd to generate the fzf list for directory completion
  _fzf_compgen_dir() {
    fd --type d --follow --exclude ".git" . "$1"
  }
fi

# alias
alias sc="source $HOME/.zshrc"
alias ls="exa --icons"
alias el="exa -la"
alias elg="exa -la --group-directories-first"
alias eld="exa -la -s=modified"
alias path='echo $PATH | tr ":" "\n" | nl'
alias fpath='echo $FPATH | tr ":" "\n" | nl' # FPATH The search path for function definitions.
alias u="ultralist"
alias d='dirs -v | fzf' # dirs command shell builtin is used to display the list of currently remembered directories
alias sail='bash vendor/bin/sail' # Laravel sail. Only can be used in Laravel project directory.
alias dush="du -sh * | sort -h" # List all files and directories size in human readable format.

# Make QT app look like gnome app
export QT_QPA_PLATFORMTHEME='gnome'

# run npm script (requires jq) / allow to pass args
fns() {
  local script
  script=$(cat package.json | jq -r '.scripts | keys[] ' | sort | fzf) && npm run $(echo "$script") "$@"
}

update_mirrorlist() {
  cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.`date +'%d%m%Y'`.bak
  reflector --country 'Singapore' --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
}

powerline_precmd() {
    PS1="$(powerline-go -error $? -jobs $(jobs -p | wc -l) -hostname-only-if-ssh -cwd-mode dironly)"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

install_powerline_precmd() {
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

if type "fnm" > /dev/null;  then
    # Setup fnm node manager
    eval "$(fnm env --use-on-cd)"
fi


# Load Angular CLI autocompletion.
if type ng &> /dev/null; then
    # source <(ng completion script)
fi


if test -f /opt/asdf-vm/asdf.sh; then
    export ASDF_CONFIG_FILE="$HOME/.config/asdf/.asdfrc"
    . /opt/asdf-vm/asdf.sh
fi

if ! type vi > /dev/null; then
    echo "vi not exist"
    ln -s /usr/bin/vim $HOME/.local/bin/vi
fi

## bat as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

function rename_wezterm_title {
  echo "\x1b]1337;SetUserVar=panetitle=$(echo -n $1 | base64)\x07"
}

function delete_local_branch {
  git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D
}

#set +x
