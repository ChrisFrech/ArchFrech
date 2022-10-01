$ sudo pacman -S $(awk '{print $1}'  packages.txt)

# Clone "yay" AUR package helper
&& git clone https://aur.archlinux.org/yay.git

# Go to install directory
&& cd yay

# Install "yay"
&& makepkg -si --noconfirm

#  Go back to main directory
&& cd ..