#!/bin/bash
cd "$(dirname "$0")"
git pull

function installCTAGS() {
  echo "Now installing CTAGS"
  brew install ctags
}

function installPIP() {
    echo "Installing PIP"
    if [[ -e "./get-pip.py" ]]
    then
      echo "PIP already installed"
    else
      echo "PIP install requires sudo"
      curl -o get-pip.py https://bootstrap.pypa.io/get-pip.py
      sudo python get-pip.py
    fi
}

function installVirtualEnv() {
  echo "Installing Python virtualenv"
  echo "Installing virtualenv requires sudo"
  sudo pip install virtualenv
}

function installNVM() {
  echo "Installing Node Version Manager"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
}

function installZSH() {
    echo "Installing ZSH Terminal Emulator"
    brew install zsh zsh-completions
}

function installOhMyZSH() {
    echo "Installing Oh My ZSH"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function installSCMBreeze() {
    echo "Installing SCM Breeze"
    if [[ -e "./scm_breeze" ]]
    then
      echo "Already cloned SCM Breeze"
    else
      echo "Cloning SCM Breeze"
      git clone git://github.com/scmbreeze/scm_breeze.git ./scm_breeze
    fi
    sh './scm_breeze/install.sh'
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
  installZSH
  installOhMyZSH
  installPathogen
  installCTAGS
  installSCMBreeze
  installPIP
  installVirtualEnv
  installNVM
}

doIt