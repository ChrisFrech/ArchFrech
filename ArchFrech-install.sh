#!/bin/bash

echo -ne "
 /$$$$$$$$ /$$$$$$$$       /$$$$$$                      /$$             /$$                       /$$               /$$ /$$                    
| $$_____/|_____ $$       /$$__  $$                    | $$            |__/                      | $$              | $$| $$                    
| $$           /$$/      | $$  \ $$  /$$$$$$   /$$$$$$$| $$$$$$$        /$$ /$$$$$$$   /$$$$$$$ /$$$$$$    /$$$$$$ | $$| $$  /$$$$$$   /$$$$$$ 
| $$$$$       /$$//$$$$$$| $$$$$$$$ /$$__  $$ /$$_____/| $$__  $$      | $$| $$__  $$ /$$_____/|_  $$_/   |____  $$| $$| $$ /$$__  $$ /$$__  $$
| $$__/      /$$/|______/| $$__  $$| $$  \__/| $$      | $$  \ $$      | $$| $$  \ $$|  $$$$$$   | $$      /$$$$$$$| $$| $$| $$$$$$$$| $$  \__/
| $$        /$$/         | $$  | $$| $$      | $$      | $$  | $$      | $$| $$  | $$ \____  $$  | $$ /$$ /$$__  $$| $$| $$| $$_____/| $$      
| $$$$$$$$ /$$$$$$$$     | $$  | $$| $$      |  $$$$$$$| $$  | $$      | $$| $$  | $$ /$$$$$$$/  |  $$$$/|  $$$$$$$| $$| $$|  $$$$$$$| $$      
|________/|________/     |__/  |__/|__/       \_______/|__/  |__/      |__/|__/  |__/|_______/    \___/   \_______/|__/|__/ \_______/|__/      

https://github.com/chrisfrech/ez-arch
Starting full arch installation WITHOUT ENCRYPTION...
"
sleep 3

echo -ne "
################################################################
Performing basic system preparation
################################################################
"
# Setting new font for better readability
setfont /usr/share/kbd/consolefonts/ter-124b.psf.gz

# Setting ntp server
timedatectl set-ntp true

# Installing latest keyring to prevent key errors during installation
pacman -Sy --noconfirm --needed archlinux-keyring pacman-contrib



echo -ne "
################################################################
Preparing disks & Partitions
################################################################
"
# Selecting target disk 
PS3=

# Creating partitions
# sgdisk -n 1::+500M --typecode=1:ef00 --change-name=1:'EFIBOOT' $EFI_Partition
# sgdisk -n 2::+8G --typecode=2:8300 --change-name=2:'SWAP' $SWAP_Partition
# sgdisk -n 3::-0 --typecode=3:8300 --change-name=3:'ROOT' $ROOT_Partition

# Creating filesystems on partitions
# mkfs.vfat -F32 $EFI_PARTITION
# mkswap $SWAP_Partition
# mkfs.ext4 $ROOT_Partition


echo -ne "
################################################################
Installing productive packages
################################################################
"
# Installing all packages in packages.txt
# sudo pacman -Sy --noconfirm --needed $(awk '{print $1}'  packages.txt)

# Creating initial user "arch" and set the password to "arch" !!!DO NOT LEAVE LIKE THIS!!!
# useradd -m arch
# passwd arch




echo -ne "
################################################################
Installing yay in user context
################################################################
"

# Clone "yay" AUR package helper
# git clone https://aur.archlinux.org/yay.git

# Go to install directory
# cd yay

# Install "yay"
# makepkg -si --noconfirm

#  Go back to main directory
# cd ..