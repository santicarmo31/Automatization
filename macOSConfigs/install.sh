#!/usr/bin/env bash


#           !!!!  CREDITS !!!!!!!
#
#  The base script was created by Mateo Olaya Bernal. All rights reserved.
#  find him on github: https://github.com/molayab
#


if hash brew; then
  echo "Please wait... Homebrew is updating Formulas..."
  brew update

  echo "Installing programs..."

  ./install-gnu-utils.sh

  echo "Done..."
else
  echo "You don't have Homewbrew."
  echo "Please wait... We'll install Homewbrew..."

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  source ~/.bash_profile 2> /dev/null
  source ~/.zshrc 2> /dev/null
  echo "Reloaded Shell"
  echo "Installing programs..."

  ./install-gnu-utils.sh 2>&1 > /dev/null

  echo "Done..."
fi

if [ ! -d $HOME/.oh-my-zsh ]; then
  echo "You don't have Oh My ZSH."
  echo "Please wait... We'll install ZSH"

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  chsh -s /bin/zsh
else
  cat zsh/zshrc > $HOME/.zshrc
  echo "ZSH was installed succesful..."
fi

if hash rvm; then
  echo "Your Ruby current version is:"
  ruby --version
  echo " > Ruby is hosted in:"
  which ruby
else
  echo "You don't have RVM."
  echo "Please wait... We'll install RVM..."

  \curl -sSL https://get.rvm.io | bash -s stable

  source ~/.bash_profile 2> /dev/null
  source ~/.zshrc 2> /dev/null
  echo "Reloaded Shell"

  rvm install ruby --latest
  rvm use ruby --latest --default

  source ~/.bash_profile 2> /dev/null
  source ~/.zshrc 2> /dev/null
  echo "Reloaded Shell"

  echo "Done..."
  echo

  echo "Your Ruby current version is:"
  ruby --version
  echo " > Ruby is hosted in:"
  which ruby
fi

echo "Installing macOS Applications"
./install-macos-applications.sh


echo "Installing Git configuration"
./install-git-configuration.sh

echo "Done: Please restart Terminal app or use iTerm instead"