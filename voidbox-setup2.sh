#!bin/bash

#installation openbox
echo 'setting up openbox and tint2'
cp ./dotfiles/openbox/autostart ~/.config/openbox/ || ERROR="Failure to copy 'autostart'"
rm ~/.config/openbox/rc.xml || ERROR="Failure to remove 'rc.xml'"
cp ./dotfiles/openbox/rc.xml ~/.config/openbox || ERROR="Failure to copy 'rc.xml'"

#openbox themes installation
git clone https://github.com/addy-dclxvi/openbox-theme-collections ~/.themes || ERROR="Failure to install openbox themes"

#tint2 theme installation
git clone https://github.com/addy-dclxvi/tint2-theme-collections ~/.config/tint2 --depth 1 || ERROR="Failure to install tint2 themes"

echo "Error: $ERROR"
