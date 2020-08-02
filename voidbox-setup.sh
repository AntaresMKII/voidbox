#!/bin/bash
#A script to install everithing you need to start

sudo xbps-install -S void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree

sudo mkdir -p /etc/xbps.d
sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirror.clarkson.edu/voidlinux|g' /etc/xbps.d/*-repository-*.conf

sudo xbps-install -Syu

#services
sudo xbps-install -y dbus elogind xorg 
#openbox and lightdm
sudo xbps-install -y openbox obconf obmenu obmenu-generator tint2 nitrogen gtk+ lightdm lightdm-gtk-greeter-settings lxappearance picom polybar
#zsh
sudo xbps-install -y bash-completion zsh wget
#ho-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
#setup oh-my-zsh

#wifi (connman)
sudo xbps-install -y connman connman-ui connman-gtk
#audio
sudo xbps-install -y alsa-utils alsa-plugins-pulseaudio pa-applet
#other programs
sudo xbps-install -y terminator Thunar chromium rofi


#activate services
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/elogind /var/service
sudo ln -s /etc/sv/alsa /var/service
sudo ln -s /etc/sv/connmand /var/service
sudo ln -s /etc/sv/lightdm /var/service
