# <img src="doc/img/neovim.png" width="64" height="64" style="vertical-align:middle" /> nvim-config

Personal Neovim configuration files

## Dependencies

1. [win32yank](https://github.com/equalsraf/win32yank/releases) - Only needed to fix some clipboard functionality when using Windows and WSL. Download the zip file and extract it to a WSL Linux directory on the `$PATH`.

## Setup

Clone the repository into Neovim's configuration path (referred to here as `$NVIM_CONFIG`). This path is usally `~/.config/nvim`, but can differ based on the system setup. Open nvim and type `echo stdpath("config")` to retreive the correct path.

```bash
export NVIM_CONFIG="${HOME}/.config/nvim" && \
mkdir -p $NVIM_CONFIG && \
git clone git@github.com:mattmccarty/nvim-config.git $NVIM_CONFIG
```

## Configure

Once the setup is complete, open nvim and install the plugins.

1. Install [vim-plug](https://github.com/junegunn/vim-plug#neovim)
2. Run `:PackerInstall`
3. Run `:PlugInstall`

### [Packer](https://github.com/wbthomason/packer.nvim)

Packer is a widely used package manager for Neovim. It has been configured in the Lua files, but the plugins need to be installed by running `:PackerInstall`.

### [Vim-plug](https://github.com/junegunn/vim-plug)

Vim-plug is a package manager for Vim. Many Vim plugins can be used with Neovim, so vim-plug has been configured as well. Just like Packer, the install command `:PlugInstall` needs to be executed when loading nvim for the first time. However, before the command can run, vim-plug must be installed. See their [GitHub page for install instructions](https://github.com/junegunn/vim-plug#neovim).

#### Install for Linux

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

#### Install for Windows (Powershell)

```Powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```
