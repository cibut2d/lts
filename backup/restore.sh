#!/bin/bash
#Julak Bantur
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
clear
echo -e "\033[0;33m Silahkan Masukin Token ID Backup Kamu \033[0m"
read -rp "Token ID: " -e id
wget -O backup.zip "https://drive.google.com/u/4/uc?id=${id}&export=download"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Start Restore
cd /root/backup
cp passwd /etc/
cp group /etc/
cp shadow /etc/
cp gshadow /etc/
cp cbt /etc/
cp -r var/lib/
echo -e "\033[0;34m Proses Restore file \033[0m"
cp -r per /etc/
echo -e "\033[0;34m Proses Restore Xray \033[0m"
cp -r xray /etc/
#echo -e "\033[0;34m Proses Restore Slowdns \033[0m"
#cp -r slowdns /etc/
cp -r public_html /home/vps/
systemctl restart xray
echo -e "\033[0;34m Proses Restore SELESAI !!!! \033[0m"
rm -rf /root/backup
rm -f backup.zip
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
