# ibnumalik's dotfiles

This repo exist to help us synchronize the configuration for our favorite cli app, such as git, tmux and vim. Hopefully this will create a seamless experience when we are reinstalling or moving to other devices. Instead of setting up everything again, we just need to clone this repo and can start doing our work.

## Usage

Use `yadm` to manage dotfiles. The reason being is it is easy to setup and the underlying usage is basically just git. So, before we can begin using our dotfiles, kindly install `yadm` so we can just clone it to the machine and use it right away.

### Tips

Clone the repo using ssh url.

```bash
yadm clone git@github.com:ibnumalik/dotfiles.git
```

## Fonts

This are the fonts used by our apps.

* SauceCodePro Nerd Font
* JetBrains Mono
* Fira Code

## ZSH

how to setup autocompletion. how to manage PATH. what is needed to install so our alias and binding works when using zsh. should we use oh-my-zsh

## rofi

Rofi, like dmenu, will provide the user with a textual list of options where one or more can be selected. This can either be running an application, selecting a window, or options provided by an external script.

### Usage

```bash
rofi -show window
```

### Shortcut

Set global shortcut to <kbd>ctrl</kbd> <kbd>space</kbd>

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

## git

This app need to present to give enjoyable working experience.

1. vim

### commit

When commiting, git will use ~/scripts/.git-commit-template

## keyboard

swap <kbd>ctrl</kbd> with <kbd>CapsLk</kbd>.

```bash
setxkbmap -option ctrl:swapcaps
```

## General recommendations

1. Use zsh and oh-my-zsh for easy theming and autocomplete.
2. Install autocomplete for `npm`.
