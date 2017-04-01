#!/bin/bash
source $MY_CONFIG_EXT/functions.sh

my_require homebrew
case "$1" in
install)
	my_brew_install rbenv ruby-build ruby-bundler
  my_env "if which rbenv > /dev/null; then eval \"\$(rbenv init -)\"; fi"
  my_brew_install openssl
  brew link openssl --force
	rbenv install 2.3.0
  rbenv global 2.3.0
  echo "gem: --no-document" > ~/.gemrc
  gem install bundler
	gem install rails 4.2.5.1
  gem install pry
  rbenv rehash

   # A few Rails features, such as the Asset Pipeline, depend on a Javascript runtime. We will install Node.js to provide this functionality.
  my_brew_install nodejs

;;
remove)
;;
esac
