#!/bin/bash


sudo xbps-install -y bash-completion zsh wget nano || ERROR="Installation failed (3)"

#wifi (connman)
sudo xbps-install -y connman connman-ui connman-gtk || ERROR="Installation failed (4)"
#audio
sudo xbps-install -y alsa-utils alsa-plugins-pulseaudio pa-applet || ERROR="Installation failed (5)"
#other programs
sudo xbps-install -y terminator Thunar firefox rofi geany xterm || ERROR="Installation failed (6)"

echo 'activating services'
activate services
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/elogind /var/service
sudo ln -s /etc/sv/alsa /var/service
sudo rm /var/service/NetworkManager
sudo ln -s /etc/sv/connmand /var/service
sudo ln -s /etc/sv/lightdm /var/service
sudo ln -s /etc/sv/lightdm /var/service

echo "Error: $ERROR"
