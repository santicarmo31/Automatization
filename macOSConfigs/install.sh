#!/usr/bin/env bash


#           !!!!  CREDITS !!!!!!!
#
#  The base script was created by Mateo Olaya Bernal. All rights reserved.
#  find him on github: https://github.com/molayab
#


if [ ! -d $HOME/.oh-my-zsh ]; then
  echo "You don't have Oh My ZSH."
  echo "Please wait... We'll install ZSH"

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  chsh -s /bin/zsh
else
  cat zsh/zshrc > $HOME/.zshrc
  echo "ZSH was installed succesfull..."
fi

if [[ $(command -v brew) == "" ]]; then
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating Homebrew"
    brew update
fi

echo "Installing macOS Applications"
./install-macos-applications.sh


echo "Installing Git configuration"
./install-git-configuration.sh

echo "Done: Please restart Terminal app or use iTerm instead"
