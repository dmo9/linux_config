#!/bin/bash
# yay is an AUR helper that kinda makes it easier to sync (aka install) packages from Arch user
# repository (AUR)

# install yay
# Alternatively to yay, aurutils could be used and a local repo created.
# Then, install the packages with pacman. 

echo Installing yay, the aur helper package...
echo _________________________________________
cd ~
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay 
makepkg -si
cd ~
rm -rf yay

# copy the configuration repo to the new system
echo Cloning .config repo from github...
rm -rf ~/.config
git clone https://github.com/dmo9/.config


# remove extra, unnecessary folders
rm ~/Documents
rm ~/Music
rm ~/Pictures
rm ~/Public
rm ~/Templates
rm ~/Videos



#  get the chitubox binary from their site
# the aur package needs this
# wget -c 'https://sac.chitubox.com/software/download.do?softwareId=17839&softwareVersionId=v1.9.5&fileName=CHITUBOX_V1.9.5.tar.gz' -o CHITUBOX_V1.9.5.tar.gz
# install all the main packages 
# install all the aur packages using yay
echo Installing all Arch and AUR pacakges...
echo _______________________________________
cd ~/.config/arch
sudo pacman -S --needed - < pkglist.txt
yay -S --needed - < pkglist_aur.txt

# remove the chitubox file because we dont need it anymore 
# rm ~/CHITUBOX_V1.9.5.tar.gz


# set fish as the default shell
echo Setting fish as the default shell...
chsh -s /usr/bin/fish


# enable gdm, the gnome desktop manager to run at startup
sudo systemctl enable gdm.service

# add github user credentials 
echo Setting up git on this machine...
echo -n Enter git email:
read -s email
git config --global user.email $email
git config --global user.name "David O'Brien"
