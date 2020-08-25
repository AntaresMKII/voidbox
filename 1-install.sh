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
	read ans
	if [[ $ans == 'default' || $ans == 'd' ]]; then
		ans=$1
	fi
	echo $ans
	}

#=======================================================================
#	Program selection
#=======================================================================

echo '#################################################'
echo 'Enter the pakage name of your terminal of choice. Enter [d]efault for $TERMINAL'
TERMINAL=$(programSelection $TERMINAL)						#terminal selection

echo 'Enter the pakage name of your browser of choice. Enter [d]efault for $BROWSER'
BROWSER=$(programSelection $BROWSER)							#browser selection

echo 'Enter the pakage name of your file manager of choice. Enter [d]efault for $FILE_MANAGER'
FILE_MANAGER=$(programSelection $FILE_MANAGER)			#file manager selection

echo 'Enter the pakage name of your text editor of choice. Enter [d]efault for $TEXT_EDITOR'
TEXT_EDITOR=$(programSelection $TEXT_EDITOR)				#text editor selection

echo 'Enter the pakage name of your grafical text editor of choice. Enter [d]efault for $TEXT_EDITOR_G'
TEXT_EDITOR_G=$(programSelection $TEXT_EDITOR_G)	#graphical text editor selection

echo 'Enter the pakage name of your window manager of choice. Enter [d]efault for $WM'
WM=$(programSelection $WM)								#window manager selection

echo 'Enter the pakage name of your shell of choice. Enter [d]efault for $SHELL'
SHELL=$(programSelection $SHELL)								#shell selection

#=======================================================================
#	dbus and elogind installation and activation
#=======================================================================

echo '#################################################'
echo 'The terminal will now prompt you for your password in order to install the progrmas'
echo 'installing dbus and elogind'

sudo xbps-install -Sy dbus elogind

echo 'activating dbus and elogind services'
sudo ln -s /etc/sv/dbus /var/service/dbus
sudo ln -s /etc/sv/elogind /var/service/elogind

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

if	[[ $WM == 'openbox' ]]; then
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

sudo xbps-install -Sy lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

#=======================================================================
#	connman installation
#=======================================================================

echo '#################################################'
echo 'installing connman and related packages'

sudo xbps-install -Sy connman connman-gtk

#activating services for connman
sudo rm /var/service/NetworkManager
sudo ln -s /etc/sv/connmand /var/service/connmand

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
sudo ln -s /etc/sv/lightdm /var/service/lightdm
