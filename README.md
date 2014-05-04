Dotfiles
========
This repository includes all of my custom dotfiles as well as vim plugins that
are managed using git submodules.  They should be cloned to your home directory
so that the path is `~/dotfiles/`.  The included setup script creates symlinks
from your home directory to the files which are located in `~/dotfiles/`.

The setup script is smart enough to back up your existing dotfiles into a
`~/dotfiles_old/` directory if you already have any dotfiles of the same name as
the dotfile symlinks being created in your home directory. If you have executed
this setup script before it will unlink previous links and recreate them.

So, to recap, the install script will:

1. Back up any existing dotfiles in your home directory to `~/dotfiles_old/`
2. Create symlinks to the dotfiles in `~/dotfiles/` in your home directory

Installation
------------

``` bash
git clone --recursive git@github.com:SweetAndLow/dotfiles.git ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```

Updating Submodules
-------------------
git submodule foreach git pull origin master

