#!/bin/bash
#=======================================================================
#	1-install.sh
#=======================================================================
#Author: Yannick Abouem (AnatresMKII)
#Date: 8/25/2020
#Description:
#This script installs some programs to use and customize your voidlinux
#=======================================================================
#	Software selection
#=======================================================================

TERMINAL='urxvt'		#default terminal
BROWSER='firefox'		#default web browser
FILE_MANAGER='Thunar'	#default file manager
TEXT_EDITOR='vim'		#default text editor
TEXT_EDITOR_G='geany'	#default grafical text editor
WM='openbox'			#default window manager
SHELL='zsh'				#default shell

#=======================================================================
#	programSelection function
#=======================================================================

programSelection() {
	echo '#################################################'
	echo 'Enter the pakage name of your $1 of choice.'
	echo 'Write [d]efault for $2'
	read ans
	if [[$ans == 'default' || $ans == 'd']]; then
		ans=$2
	fi
	echo '$ans will be installed'
	return $ans
	}

#=======================================================================
#	Program selection
#=======================================================================

TERMINAL=$(programSelection 'terminal' $TERMINAL)						#terminal selection
BROWSER=$(programSelection 'browser' $BROWSER)							#browser selection
FILE_MANAGER=$(programSelection 'file manager' $FILE_MANAGER)			#file manager selection
TEXT_EDITOR=$(programSelection 'text editor' $TEXT_EDITOR)				#text editor selection
TEXT_EDITOR_G=$(programSelection 'text editor (gui)' $TEXT_EDITOR_G)	#graphical text editor selection
WM=$(programSelection 'window manager' $WM)								#window manager selection
SHELL=$(programSelection 'shell' $SHELL)								#shell selection

#=======================================================================
#	dbus and elogind installation and activation
#=======================================================================

echo '#################################################'
echo 'The terminal will now prompt you for your password in order to install the progrmas'
echo 'installing dbus and elogind'

sudo xbps-install -Sy dbus elogind

echo 'activating dbus and elogind services'
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/elogind /var/service

#=======================================================================
#	xorg installation
#=======================================================================

echo '#################################################'
echo 'installing Xorg and related packages'

sudo xbps-install -Sy xorg

#=======================================================================
#	Installing the window manager
#=======================================================================

echo '#################################################'
echo 'installing $WM'

if	[[$WM == 'openbox']]; then
	sudo xbps-install -Sy openbox obconf obmenu obmenu-generator
else
	sudo xbps-install -Sy $WM
fi

#=======================================================================
#	gtk+ and lxappearance installation
#=======================================================================

echo '#################################################'
echo 'installing gtk+ and lxappearance'

sudo xbps-install -Sy gtk+ lxappearance

#=======================================================================
#	picom, tint2 and nitrogen installation
#=======================================================================

echo '#################################################'
echo 'installing picom, tint2 and nitrogen'

sudo xbps-install -Sy tint2 nitrogen picom

#=======================================================================
#	lightdm and lightdm-greeter-settings
#=======================================================================

echo '#################################################'
echo 'installing lightdm and lightdm-greeter-settings'

sudo xbps-install -Sy lightdm lightdm-greeter-settings

#=======================================================================
#	connman installation
#=======================================================================

echo '#################################################'
echo 'installing connman and related packages'

sudo xbps-install -Sy connman conman-ui connman-gtk

#activating services for connman
sudo rm /var/service/NetworkManager
sudo ln -s /etc/sv/connmand /var/service

#=======================================================================
#	alsa installation
#=======================================================================

echo '#################################################'
echo 'installing alsa and related packages'

sudo xbps-install -Sy lsa-utils alsa-plugins-pulseaudio

#=======================================================================
#	installing other programs
#=======================================================================

echo '#################################################'
echo 'installing other programs'

sudo xbps-install -Sy $TERMINAL $BROWSER $FILE_MANAGER $TEXT_EDITOR $TEXT_EDITOR_G $SHELL bash-completion

#=======================================================================
#	other programs
#=======================================================================
#add all the programs you wish under here

#sudo xbps-install -Sy your-package-here

#=======================================================================
#	finishing installation
#=======================================================================
echo 'Done!'

#activating lightdm
sudo ln -s /etc/sv/lightdm /var/service

#=======================================================================
