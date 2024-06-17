#!/usr/bin/env bash


#           !!!!  CREDITS !!!!!!!
#
#  The base script was created by Mateo Olaya Bernal. All rights reserved.
#  find him on github: https://github.com/molayab
#

if [ ! -d $HOME/.oh-my-zsh ]; then
  echo "You don't have Oh My ZSH."
  echo "👨‍💻 Please wait... We'll install ZSH 👨‍💻"

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  chsh -s /bin/zsh # Change login shell
  exit 0
else
  echo "ZSH was installed succesfull..."
fi

# Install Homebrew if it's not installed
if [[ $(command -v brew) == "" ]]; then
    echo "👨‍💻 Installing Homebrew 👨‍💻"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "👨‍💻 Installing Git configuration 👨‍💻"
./install-git-configuration.sh


echo "👨‍💻 Installing rbenv ruby 👨‍💻"
brew install rbenv ruby-build
echo 'eval export PATH="~/.rbenv/shims:${PATH}"' >> ~/.zshrc
echo 'export RBENV_SHELL=zsh' >> ~/.zshrc
echo 'source '/opt/homebrew/Cellar/rbenv/1.2.0/libexec/../completions/rbenv.zsh'' >> ~/.zshrc
rbenv install 3.3.3
rbenv global 3.3.3

echo "Done: Please restart Terminal app"
