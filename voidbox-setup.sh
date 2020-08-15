#!/bin/bash
#A script to install everithing you need to start

echo 'Installing additional repositories for xbps'

sudo xbps-install -Sy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree

echo 'Changing repository mirror to New York'

sudo mkdir -p /etc/xbps.d
sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirror.clarkson.edu/voidlinux|g' /etc/xbps.d/*-repository-*.conf

echo 'Updating the system'

sudo xbps-install -Syu

#services
echo 'installing dbus elogind and xorg'
sudo xbps-install -y dbus elogind xorg 
#openbox and lightdm
echo 'installing programs'
sudo xbps-install -y openbox obconf obmenu obmenu-generator tint2 nitrogen gtk+ lightdm lightdm-gtk-greeter-settings lxappearance picom
#zsh
sudo xbps-install -y bash-completion zsh wget nano

#wifi (connman)
sudo xbps-install -y connman connman-ui connman-gtk
#audio
sudo xbps-install -y alsa-utils alsa-plugins-pulseaudio pa-applet
#other programs
sudo xbps-install -y terminator Thunar firefox rofi geany xterm

#installation openbox
echo 'setting up openbox and tint2'
cp ./dotfiles/openbox/autostart ~/.config/openbox/
rm ~/.config/openbox/rc.xml
cp ./dotfiles/openbox/rc.xml ~/.config/openbox

#openbox themes installation
git clone https://github.com/addy-dclxvi/openbox-theme-collections ~/.themes

#tint2 theme installation
git clone https://github.com/addy-dclxvi/tint2-theme-collections ~/.config/tint2 --depth 1 



echo 'activating services'
#activate services
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/elogind /var/service
sudo ln -s /etc/sv/alsa /var/service
sudo rm /var/service/NetworkManager
sudo ln -s /etc/sv/connmand /var/service
sudo ln -s /etc/sv/lightdm /var/service
