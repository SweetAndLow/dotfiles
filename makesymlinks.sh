#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles. It also can install keepass and configure chromeIPass.
############################

########## Variables

dir=$HOME/dotfiles # dotfiles directory
olddir=$HOME/dotfiles_old # old dotfiles backup directory
files="bashrc vimrc vim bash_custom bash_isilon" # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p "$olddir"
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd "$dir"
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks from the homedir to any files in the ~/dotfiles directory specified
# in $files
for file in $files; do
    if [ -L "$HOME/.$file" ]; then # check for symbolic link first
        echo "unlinking .$file"
        unlink "$HOME/.$file"
    elif [ -f "$HOME/.$file" -o -d "$HOME/.$file" ]; then
        echo "Moving any existing dotfiles from $HOME to $olddir"
        mv "$HOME/.$file" "$HOME/dotfiles_old/"
    fi

    echo "Creating symlink to $file in home directory."
    ln -s "$dir/$file" "$HOME/.$file"
done

# Installs keepass2 and mono-complete. Also configures symlinks for the .dll's
# that are requried to get chromeIPass working in Linux.
install_keepass2() {
    keepass_files="Newtonsoft.Json.dll KeePassHttp.dll"
    keepass_lib="/usr/lib/keepass2"
    # Test to see if keepass2 is installed
    if [ ! -d "$keepass_lib" ]; then
        echo "keepass2 isn't installed, installing..."
        platform=$(uname);
        if [ "$platform" == 'Linux' ]; then
            sudo apt-get install -y keepass2 mono-complete
        fi
    fi

    for file in $keepass_files; do
        if [ -L "$keepass_lib/$file" ]; then
            echo "unlinking $file"
            sudo unlink "$keepass_lib/$file"
        elif [ -f "$keepass_lib/$file" ]; then
            echo "Moving $file to $olddir" 
            sudo mv "$keepass_lib/$file" "$HOME/dotfiles_old/"
        fi

        echo "Creating symlink: $file in $keepass_lib"
        sudo ln -s "$dir/submodules/keepasshttp/mono/$file" "$keepass_lib/$file"
    done
}

install_keepass2
