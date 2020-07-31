#!/bin/bash
#A script to install everithing you need to start

xbps-install -S void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree

mkdir -p /etc/xbps.d
cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirror.clarkson.edu/voidlinux|g' /etc/xbps.d/*-repository-*.conf

xbps-install -Syu

#services
xbps-install -y dbus elogind xorg 
#openbox and lightdm
xbps-install -y openbox obconf obmenu obmenu-generator tint2 nitrogen gtk+ lightdm lightdm-gtk-greeter-settings
#zsh
xbps-install -y bash-completion zsh wget
#ho-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
#setup oh-my-zsh

#wifi (connman)
xbps-install -y connman connman-ui connman-gtk
#audio
xbps-install -y alsa-utils alsa-plugins-pulseaudio pa-applet
#other programs
xbps-install -y tilda krusader chromium xterm


#activate services
ln -s /etc/sv/dbus /var/service
ln -s /etc/sv/elogind /var/service
ln -s /etc/sv/alsa /var/service
ln -s /etc/sv/connmand /var/service
ln -s /etc/sv/lightdm /var/service
