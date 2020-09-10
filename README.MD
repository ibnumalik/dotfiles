# ibnumalik's dotfiles

Work in progress. Still need to figure out what's the best way to sync the dotfiles. One of the way is to use gnu stow.

## List of dotfiles

1. .vimrc
2. .gitconfig
3. .bashrc
4. .bash_aliases
5. .bash_completion


## tmux

tmux is a terminal multiplexer. It lets you switch easily between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal.

Q: Why use tmux?

A: Use tmux to have consistent cli experience accross platform. You just need to learn shortcut once and use it everywhere.

### tmux plugin manager

In the config file we are using tmux plugin manager. So, after installing tmux, install tpm to get started.

1. Clone TPM

    ```bash
    $ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```

2. Reload tmux config to activate tpm

    Activate command by pressing `prefix` and type `:source ~/.tmux.conf`

3. Install plugins

    Press `prefix` + <kbd>I</kbd> (capital i, as in Install) to fetch the plugin.    

### List of tmux plugins used

1. nord tmux
2. tmux resurrect
3. tmux yank

### tmux shortcut keys

The shortcut that is defined in the config files. If the list is growing, maybe we should move it to somewhere accessible to read.

1. Default prefix key is <kbd>ctrl</kbd> + <kbd>b</kbd>. But we change it to <kbd>ctrl</kbd> + <kbd>a</kbd> because its easier to reach. So, whenever we refer to `prefix`, its <kbd>ctrl</kbd> + <kbd>a</kbd>.

2. Split panes
    - horizontally: `prefix` then, <kbd>|</kbd>
    - vertically: `prefix` then, <kbd>-</kbd>
  
3. Switching between windows
    - previous window: `prefix` then, <kbd>ctrl</kbd> + <kbd>p</kbd>
    - next window: `prefix` then, <kbd>ctrl</kbd> + <kbd>n</kbd>

4. Config
    - reload config file: `prefix` then, <kbd>r</kbd>
    - edit config file at right side: `prefix` then, <kbd>M</kbd>

## vim

Vim is a highly configurable text editor built to make creating and changing any kind of text very efficient. It is included as "vi" with most UNIX systems and with Apple OS X.

### vim vundle

vim vundle is vim plugin manager.

Install vundle:

1. Clone

    ```
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ```
2. Launch vim and run `:PluginInstall`

## General recommendations

1. Use zsh and oh-my-zsh for easy theming and autocomplete.
2. Install autocomplete for `npm`.
