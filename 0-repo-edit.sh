#!/bin/bash
#=======================================================================
#	0-repo-edit.sh
#=======================================================================
#Description:
#Installs non free and multilib repositories fo xbps.
#Changes the mirror for the xbps repository
#=======================================================================
#	Mirrors
#=======================================================================
#	Tier 1 - Manually mantained
#	Tier 2 - Sync to nearest tier 1
#=======================================================================

declare -A mirrors

mirrors[default]=https://alpha.de.repo.voidlinux.org/current					#default mirror

mirrors[eu_finland]=https://alpha.de.repo.voidlinux.org/current					#tier 1 Finland
mirrors[us_chicago]=https://mirrors.servercentral.com/voidlinux/current			#tier 1 Chicago
mirrors[us_kansas]=https://alpha.us.repo.voidlinux.org/current					#tier 1 Kansas city
mirrors[us_newyork]=https://mirror.clarkson.edu/voidlinux/current				#tier 1 New York

mirrors[as_almaty]=https://mirror.ps.kz/voidlinux/current						#tier 2 Almaty KZ
mirrors[as_china1]=https://mirrors.bfsu.edu.cn/voidlinux/current				#tier 2 China
mirrors[as_china2]=https://mirrors.cnnic.cn/voidlinux/current					#tier 2 China
mirrors[as_china3]=https://mirrors.tuna.tsinghua.edu.cn/voidlinux/current		#tier 2 China
mirrors[as_seoul]=https://mirror.maakpain.kro.kr/void/current					#tier 2 Seoul SK
mirrors[as_singapore]=https://void.webconverger.org/current						#tier 2 Singapore
mirrors[au_canberra]=https://mirror.aarnet.edu.au/pub/voidlinux/current			#tier 2 Canberra AU
mirrors[au_melbourne]=https://ftp.swin.edu.au/voidlinux/current					#tier 2 Melbourne AU
mirrors[eu_amsterdam]=https://void.cijber.net/current							#tier 2 Amsterdam
mirrors[eu_denmark1]=http://dk.archive.ubuntu.com/voidlinux/current				#tier 2 Denmark
mirrors[eu_denmark2]=http://ftp.dk.xemacs.org/voidlinux/current					#tier 2 Denmark
mirrors[eu_denmark3]=https://mirrors.dotsrc.org/voidlinux/current				#tier 2 Denmark
mirrors[eu_hungary]=https://quantum-mirror.hu/mirrors/pub/voidlinux/current		#tier 2 Hungary
mirrors[eu_ireland]=https://mirror.i-novus.ru/mirrors/voidlinux/current			#tier 2 Ireland
mirrors[eu_russia1]=http://ftp.debian.ru/mirrors/voidlinux/current				#tier 2 Russia
mirrors[eu_russia2]=https://mirror.yandex.ru/mirrors/voidlinux/current			#tier 2 Russia
mirrors[eu_sweden1]=https://cdimage.debian.org/mirror/voidlinux/current			#tier 2 Sweden
mirrors[eu_sweden2]=https://ftp.acc.umu.se/mirror/voidlinux/current				#tier 2 Sweden
mirrors[eu_sweden3]=https://ftp.gnome.org/mirror/voidlinux/current				#tier 2 Sweden
mirrors[eu_sweden4]=https://ftp.lysator.liu.se/pub/voidlinux/current			#tier 2 Sweden
mirrors[eu_sweden5]=https://ftp.sunet.se/mirror/voidlinux/current				#tier 2 Sweden

#=======================================================================
#	Mirror selection
#=======================================================================

echo "==============================================\n"
echo "Mirror selection\n"
echo "Select the mirror nearest to you\n"
echo "==============================================\n"
for key in ${!mirrors[@]}; do
	echo $key
done
echo "Enter the name of the mirror: "
read ans
echo "==============================================\n"

#=======================================================================


