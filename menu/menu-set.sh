#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	Julak Bantur
# //	Dscription: Xray MultiPort
# //	email: putrameratus2@gmail.com
# //  telegram: https://t.me/Cibut2d
# //====================================================
# // font color configuration | JULAK BANTUR AUTOSCRIPT
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
VC="\e[0m"
Green="\e[92;1m"
BICyan='\033[1;96m'
BIYellow='\033[1;93m'
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
y='\033[1;33m' #yellow
l='\033[0;37m'
BGX="\033[42m"
CYAN="\033[96m"
z="\033[96m"
zx="\033[97;1m" # // putih
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[1;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'
cyan="\033[1;36m"
c="\033[5;33m"
###########- END COLOR CODE -##########

clear
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC${COLOR1}                     MENU SETTING                         $NC${z}│$NC"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC [${zx}01${NC}] ${COLOR1}CHANGE DOMAIN$NC" 
echo -e " ${z}│$NC [${zx}02${NC}] ${COLOR1}CHANGE PORT$NC" 
echo -e " ${z}│$NC [${zx}03${NC}] ${COLOR1}MENU WEBMIN$NC" 
echo -e " ${z}│$NC [${zx}04${NC}] ${COLOR1}MENU THEME$NC" 
echo -e " ${z}│$NC [${zx}05${NC}] ${COLOR1}SPEEDTEST$NC" 
echo -e " ${z}│$NC [${zx}06${NC}] ${COLOR1}ABUOT SCRIPT$NC" 
echo -e " ${z}│$NC [${zx}07${NC}] ${COLOR1}AUTOREBOOT$NC" 
echo -e " ${z}│$NC [${zx}08${NC}] ${COLOR1}RESTART ALL SERVICE$NC" 
echo -e " ${z}│$NC [${zx}09${NC}] ${COLOR1}CHANGE BANNER$NC" 
echo -e " ${z}│$NC [${zx}10${NC}] ${COLOR1}CEK BANDWITH$NC" 
echo -e " ${z}│$NC [${zx}11${NC}] ${COLOR1}CHANGE PASSWORD VPS$NC" 
echo -e " ${z}│$NC [${zx}12${NC}] ${COLOR1}REGISTRASI IP VPS$NC" 
echo -e " ${z}│$NC [${zx}13${NC}] ${COLOR1}INSTALL UDP CUSTOM$NC" 
echo -e " ${z}│$NC [${zx}00${NC}] ${COLOR1}BACK TO MENU$NC" 
echo -e " ${z}│$NC [${zx}99${NC}] ${COLOR1}EXIT$NC" 
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu-domain ; exit ;;
2) clear ; menu-port ; exit ;;
3) clear ; menu-webmin ; exit ;;
4) clear ; menu-theme ; exit ;;
5) clear ; speedtest ; exit ;;
6) clear ; about ; exit ;;
7) clear ; autoreboot ; exit ;;
8) clear ; restart ; exit ;;
9) clear ; nano /etc/julak.txt ; exit ;;
10) clear ; bw ; exit ;;
11) clear ; passwd ; exit ;;
12) clear ; m-ip ; exit ;;
13) clear ;rm -rf udp-custom.sh && wget -q https://raw.githubusercontent.com/cibut2d/bukuanin/main//udp-custom.sh &&  chmod +x udp-custom.sh && ./udp-custom.sh ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; menu ;;
esac
