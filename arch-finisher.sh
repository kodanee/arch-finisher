#!/bin/bash
CYAN='\033[0;36m'
WHITE='\033[0m'

set -e

echo -e "${CYAN}------------------------------------------------------"
echo -e "${CYAN}Thank u for using my script, we will get to it now! ^^"
echo -e "${CYAN}------------------------------------------------------"

sleep 2

echo -e "${CYAN}Updating your packages...${WHITE}"
sudo pacman -Syu

echo -e "${CYAN}Audio...${WHITE}"
sudo pacman -S --noconfirm --needed alsa-utils pipewire wireplumber

echo -e "${CYAN}Bluetooth...${WHITE}"
sudo pacman -S --noconfirm --needed bluez bluez-utils bluez-deprecated-tools

echo -e "${CYAN}Enabling bluetooth service...${WHITE}"
sudo systemctl enable --now bluetooth.service

echo -e "${CYAN}Power management...${WHITE}"
sudo pacman -S --noconfirm --needed power-profiles-daemon

echo -e "${CYAN}Enabling power management service...${WHITE}"
sudo systemctl enable --now power-profiles-daemon

echo -e "${CYAN}Do you want firewall? Y/N${WHITE}"
sudo pacman -S ufw
sudo ufw enable

echo -e "${CYAN}Do you want fastfetch to flex arch? Y/N${WHITE}"
sudo pacman -S fastfetch

echo -e "${CYAN}Done! The system will reboot in 5 seconds${WHITE}"
sleep 5
reboot
