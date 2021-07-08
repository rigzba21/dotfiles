# dotfiles
A repo for my dotfiles...

## Prereqs:
#### Ubuntu:
The `.vimrc` file uses [`vim-plug` with automatic installtion](https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation), which requires the following packages:

```bash
sudo apt-get update && sudo apt-get install \
    git \
    vim \
    tmux \
    curl
```

The `.tmux.conf` file uses [`tmux-plugins`](https://github.com/tmux-plugins/tpm). Setup `tmux-plugins` using the following:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Installation:

```bash

# clone this repo
git clone https://github.com/rigzba21/dotfiles.git

# copy the vim configuration
cp ./dotfiles/.vimrc ~/.vimrc

# copy the tmux configuration
cp ./dotfiles/.tmux.conf ~/.tmux.conf
```

Now open up vim and use the command `:PlugUpdate` to update plugins.

For tmux, make sure `tpm` is installed:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Now start `tmux`, and install the tpm plugins listed in `.tmux.conf`:
```shell
#start tmux
tmux source ~/.tmux.conf
```
now from within `tmux`:
```shell
#prefix + I to intall tpm plugins
```


