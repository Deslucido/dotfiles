#!/bin/bash

#Sript personalizado para automatizar la configuración de Arch.


if [ $(whoami) = "root" ]; then passwd; else echo "No estás logeado como root"; exit; fi
echo "Contraseña de root"
echo acmpc > /etc/hostname
useradd -m -G wheel alberto
echo "Contraseña de usuario"
passwd alberto
sed -i ':a;N;$!ba;s/## Uncomment to allow members of group wheel to execute any command\n#%wheel ALL=(ALL) ALL/## Uncomment to allow members of group wheel to execute any command\n%wheel ALL=(ALL) ALL(ALL) ALL/g' /etc/sudoers #Se puede simplifocar poniendo simplemente la línea donde quiero la sustitución
ln -sf /usr/share/zoneinfo/Madrid/Europe /etc/localtime
hwclock --systohc
echo LANG=es_ES.UTF-8 > /etc/locale.conf
echo KEYMAP=es > /etc/vconsole.conf
sed -i 's/#en_US[.]UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen

ip link
read -p "Escribe el dispositivo de red que quieras usar: " dis
dis=$dis".service"
systemctl enable dhcpcd@$dis
systemctl start dhcpcd@$dis
ping -c 3 archlinux.org
read -p "Problemas de conexión? [Y/N]: " a
if [[ $a =~ ^[Yy]$ ]]; then; echo "Revisa que todo esté bien y posiblemente tengas que rehacer la instalación"; exit 1; fi
sed ':a;N;$!ba;s/# Misc options\n#UseSyslog\n#Color/# Misc options\n#UseSyslog\nColor/g' /etc/pacman.conf
sed ':a;N;$!ba;s/#\[multilib\]\n#Include = \/etc\/pacman.d\/mirrorlist/[multilib]\nInclude = \/etc\/pacman.d\/mirrorlist/g' /etc/pacman.conf
pacman -Syy

echo "configuración completa"
sl

