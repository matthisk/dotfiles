#!/bin/bash
cd "$(dirname "$0")"
git pull

function abspath {
    if [[ -d "$1" ]]
    then
        pushd "$1" >/dev/null
        pwd
        popd >/dev/null
    elif [[ -e $1 ]]
    then
        pushd "$(dirname "$1")" >/dev/null
        echo "$(pwd)/$(basename "$1")"
        popd >/dev/null
    else
        echo "$1" does not exist! >&2
        return 127
    fi
}

function syncZsh() {
  if [ -n "$ZSH_CUSTOM" ]; then
    rsync -avr ./zsh/ $ZSH_CUSTOM
  fi
}

function installPathogen() {
  if [[ -e "$HOME/.vim/autoload/pathogen.vim" ]]
  then
    echo "Pathogen is already installed"
  else
    echo "Installing Pathogen"
    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  fi
}

function doIt() {
  syncZsh
  rsync --exclude ".git/" --exclude "vim/" --exclude ".DS_Store" --exclude "scm_breeze" --exclude "sync.sh" --exclude "README.md" -av . ~
  ln -s $(abspath ./vim)  ~/.vim 
  installPathogen
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
        doIt
else
        read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
                doIt
        fi
fi
unset doIt

sh './scm_breeze/install.sh'
