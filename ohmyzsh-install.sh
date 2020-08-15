#!bin/bash

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

rm ~/.zshrc
cp ./dotfiles/zsh/.zshrc ~
