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
grenbo="\e[92;1m"
YELL='\033[0;33m'
c="\033[5;33m"
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
Font="\033[0m"
###########- END COLOR CODE -##########

cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
total_ram=$(grep "MemTotal: " /proc/meminfo | awk '{ print $2}')
totalram=$(($total_ram / 1024))
MYIP=$(curl -sS ipv4.icanhazip.com)
LAST_DOMAIN="$(cat /etc/xray/domain)"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }

clear
echo -e "\033[0;33m   ┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[0;33m   │\033[0m            \033[0;32mCHANGE DOMAIN VPS\033[0m             \033[0;33m|\033[0m"
echo -e "\033[0;33m   └──────────────────────────────────────────┘\033[0m"
echo -e "     ${RED}Autoscript Julak Bantur Tunneling (multi port)${NC}"
echo -e "${RED}Make sure the internet is smooth when installing the script${NC}"
echo -e "───────────────────────────────────────────────────────"
echo -e ""
echo -e "       ${GREEN}Hostname${NC}    :  $LAST_DOMAIN"
echo -e "       ${GREEN}Public IP${NC}   :  $MYIP"
echo -e "       ${GREEN}Total RAM${NC}   :  $totalram MB"
echo -e ""
echo -e "───────────────────────────────────────────────────────"
read -rp "Input ur Domain/Host : " -e bukit
rm -rf /etc/xray/domain
rm -rf /etc/v2ray/domain
rm -rf /etc/xray/scdomain
rm -rf /etc/v2ray/scdomain
echo "$bukit" > /root/domain
echo "$bukit" > /etc/v2ray/domain
echo "$bukit" > /etc/xray/domain
echo "$bukit" > /etc/v2ray/scdomain
echo "$bukit" > /etc/xray/scdomain
echo "IP=$bukit" > /var/lib/ipvps.conf
certv2ray
