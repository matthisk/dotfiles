#!/bin/bash
cd "$(dirname "$0")"
git pull


function installCTAGS() {
  echo "Now installing CTAGS"
  brew install ctags
}

function installGoLang() {
  echo "Creating GO home directory"
  if [[ -e "$HOME/Go" ]]
  then
    echo "$HOME/Go already exists"
  else
    mkdir $HOME/Go
  fi
  mkdir -p $HOME/Go/src/github.com/user

  GOPATH=$HOME/Go
  GOROOT=/usr/local/opt/go/libexec
  PATH=$PATH:$GOPATH/bin
  PATH=$PATH:$GOROOT/bin

  echo "Now installing go using homebrew"
  brew install go
}

function installPython3() {
  echo "Now installing Python3 (using homebrew)"
  brew install python3
}

function installAWSCLI() {
  echo "Now installing AWS CLI"
  pip3 install awscli --upgrade
}

function installVirtualEnv() {
  echo "Installing Python virtualenv"
  echo "Installing virtualenv requires sudo"
  pip3 install virtualenv --upgrade
  pip3 install virtualenvwrapper --upgrade
}

function installNVM() {
  echo "Installing Node Version Manager"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
  echo "Installing stable node"
  echo "Creating /usr/local/bin/node /usr/local/bin/npm"

  echo "#\!/bin/bash
export NVM_DIR=\"/usr/local/nvm\"
[ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\"
npm \$@" > /usr/local/bin/npm
  chmod +x /usr/local/bin/npm

  echo "#\!/bin/bash
export NVM_DIR=\"/usr/local/nvm\"
[ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\"
node \$@" > /usr/local/bin/node
  chmod +x /usr/local/bin/node
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

function installUtils() {
  echo "Installing utils: lnav, tig"
  brew install lnav tig
}

function doIt() {
  installZSH
  installOhMyZSH
  installPathogen
  installCTAGS
  installSCMBreeze
  installPython3
  installVirtualEnv
  installNVM
  installGoLang
  installAWSCLI
  installUtils
}

doIt
