echo -ne "
  /$$$$$$  /$$                 /$$           /$$        /$$$$$$                      /$$             /$$       /$$                                          
 /$$__  $$| $$                |__/          | $/       /$$__  $$                    | $$            | $$      |__/                                          
| $$  \__/| $$$$$$$   /$$$$$$  /$$  /$$$$$$$|_/       | $$  \ $$  /$$$$$$   /$$$$$$$| $$$$$$$       | $$       /$$ /$$$$$$$  /$$   /$$ /$$   /$$            
| $$      | $$__  $$ /$$__  $$| $$ /$$_____/          | $$$$$$$$ /$$__  $$ /$$_____/| $$__  $$      | $$      | $$| $$__  $$| $$  | $$|  $$ /$$/            
| $$      | $$  \ $$| $$  \__/| $$|  $$$$$$           | $$__  $$| $$  \__/| $$      | $$  \ $$      | $$      | $$| $$  \ $$| $$  | $$ \  $$$$/             
| $$    $$| $$  | $$| $$      | $$ \____  $$          | $$  | $$| $$      | $$      | $$  | $$      | $$      | $$| $$  | $$| $$  | $$  >$$  $$             
|  $$$$$$/| $$  | $$| $$      | $$ /$$$$$$$/          | $$  | $$| $$      |  $$$$$$$| $$  | $$      | $$$$$$$$| $$| $$  | $$|  $$$$$$/ /$$/\  $$            
 \______/ |__/  |__/|__/      |__/|_______/           |__/  |__/|__/       \_______/|__/  |__/      |________/|__/|__/  |__/ \______/ |__/  \__/            
                                                                                                                                                            
                                                                                                                                                            
                                                                                                                                                            
 /$$                       /$$               /$$ /$$             /$$     /$$                           /$$                 /$$                              
|__/                      | $$              | $$| $$            | $$    |__/                          | $$                | $$                              
 /$$ /$$$$$$$   /$$$$$$$ /$$$$$$    /$$$$$$ | $$| $$  /$$$$$$  /$$$$$$   /$$  /$$$$$$  /$$$$$$$       | $$$$$$$   /$$$$$$ | $$  /$$$$$$   /$$$$$$   /$$$$$$ 
| $$| $$__  $$ /$$_____/|_  $$_/   |____  $$| $$| $$ |____  $$|_  $$_/  | $$ /$$__  $$| $$__  $$      | $$__  $$ /$$__  $$| $$ /$$__  $$ /$$__  $$ /$$__  $$
| $$| $$  \ $$|  $$$$$$   | $$      /$$$$$$$| $$| $$  /$$$$$$$  | $$    | $$| $$  \ $$| $$  \ $$      | $$  \ $$| $$$$$$$$| $$| $$  \ $$| $$$$$$$$| $$  \__/
| $$| $$  | $$ \____  $$  | $$ /$$ /$$__  $$| $$| $$ /$$__  $$  | $$ /$$| $$| $$  | $$| $$  | $$      | $$  | $$| $$_____/| $$| $$  | $$| $$_____/| $$      
| $$| $$  | $$ /$$$$$$$/  |  $$$$/|  $$$$$$$| $$| $$|  $$$$$$$  |  $$$$/| $$|  $$$$$$/| $$  | $$      | $$  | $$|  $$$$$$$| $$| $$$$$$$/|  $$$$$$$| $$      
|__/|__/  |__/|_______/    \___/   \_______/|__/|__/ \_______/   \___/  |__/ \______/ |__/  |__/      |__/  |__/ \_______/|__/| $$____/  \_______/|__/      
                                                                                                                              | $$                          
                                                                                                                              | $$                          
                                                                                                                              |__/      
Starting full arch installation WITHOUT ENCRYPTION...
"

echo -ne "
################################################################
Performing basic system preparation
################################################################
"
# Setting ntp server
timedatectl set-ntp true

# Setting new font for better readability
setfont /usr/share/kbd/consolefonts/ter-124b.psf.gz

# Installing latest keyring to prevent key errors during installation
pacman -Sy --noconfirm --needed archlinux-keyring pacman-contrib terminus-font


echo -ne "
################################################################
Preparing disks & Partitions
################################################################
"
# Creating partitions
sgdisk -n 1::+500M --typecode=1:ef00 --change-name=1:'EFIBOOT' 
sgdisk -n 2::+8G --typecode=2:8300 --change-name=2:'SWAP' 
sgdisk -n 3::-0 --typecode=3:8300 --change-name=3:'ROOT'

# Creating filesystems on partitions
mkfs.vfat -F32 $DISK_PARTITION


echo -ne "
################################################################
Installing productive packages
################################################################
"
# Installing all packages in packages.txt
sudo pacman -Sy --noconfirm --needed $(awk '{print $1}'  packages.txt)

# Creating initial user "arch" and set the password to "arch" !!!DO NOT LEAVE LIKE THIS!!!
useradd -m arch
passwd arch




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