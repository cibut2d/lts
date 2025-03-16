#!/bin/bash
#By Julak Bantur
#Papadaan Store
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'

# // Exporting Language to UTF-8
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
###########- END COLOR CODE -##########
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
clear 
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1  $NC     ${BICyan}BACKUP VPS SETTING ${NC}    $COLOR1 $NC"
echo -e ""
echo -e "$COLOR1 $NC   ${BICyan}[${WH}01${BICyan}]${NC} ${WH}• ${COLOR1}Backup Data Vps ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}02${BICyan}]${NC} ${WH}• ${COLOR1}Restore Data Vps ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}03${BICyan}]${NC} ${WH}• ${COLOR1}Auto Backup Data Vps ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}04${BICyan}]${NC} ${WH}• ${COLOR1}Backup Vps To Github ${NC}     $COLOR1 $NC"
echo -e "$COLOR1 $NC   ${BICyan}[${WH}00${BICyan}]${NC} ${WH}• ${COLOR1}Back To Menu ${NC}     $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────────┘${NC}"
echo -e "     ${COLOR1}Press x or [ Ctrl+C ] • To-Exit${NC}"
echo ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
01 | 1) clear ; backup ;;
02 | 2) clear ; restore ;;
03 | 3) clear ; autobackup ;;
04 | 4) clear ; menu-bckp ;;
00 | 0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "salah tekan sayang" ; sleep 1 ; menu-backup ;;
esac