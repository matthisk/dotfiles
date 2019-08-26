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
  if [ -n "$ZSH_CUSTOM" ]; 
  then
    rsync -avr ./zsh/ $ZSH_CUSTOM
  fi
}

function doIt() {
  syncZsh
  rsync --exclude ".git/" --exclude "iterm/" --exclude ".DS_Store" --exclude "scm_breeze" --exclude "sync.sh" --exclude "README.md" -av . ~
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

