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

# // Gettings Info
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
#ns=$(cat /etc/xray/dns)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
# // USERNAME IZIN
rm -f /usr/bin/user
username=$(curl -sS https://raw.githubusercontent.com/cibut2d/reg/main/ip | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user

# // VALIDITY
rm -f /usr/bin/e
valid=$(curl -sS https://raw.githubusercontent.com/cibut2d/reg/main/ip | grep $MYIP | awk '{print $3}')
echo "$valid" > /usr/bin/e

# // DETAIL ORDER IZIN IP
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)

clear
# // DAYS LEFT
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))

# // VPS INFORMATION
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status ExpiRED Active | Julak Bantur

# // AKTIVATED & EXPIRED
Info="${green}Activated${NC}"
Error="${RED}Expired ${NC}"
#//
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl -sS https://raw.githubusercontent.com/cibut2d/reg/main/ip | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear

# // GETTINGS SYSTEM
uptime="$(uptime -p | cut -d " " -f 2-10)"
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(service dropbear status | grep active | cut -d ' ' $stat)
udp_service=$(service udp-custom status | grep active | cut -d ' ' $stat)
xray_service=$(service xray status | grep active | cut -d ' ' $stat)
nginx_service=$(service nginx status | grep active | cut -d ' ' $stat)
#Status | Julak Bantur
clear


# // RUNNING SSH
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${green}ON${NC}"
else
   status_ssh="${RED}OF${NC} "
fi

# // RUNNING WEBSOCKET
ssh_ws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [[ $ssh_ws == "active" ]]; then
    status_ws_epro="${green}ON${NC}"
else
    status_ws_epro="${RED}OF${NC} "
fi

# RUNNING UDP
if [[ $udp_service == "active" ]]; then 
   status_udp="${green}ON${NC}"
else
   status_udp="${RED}OFF${NC} "
fi

# RUNNING XRAY
if [[ $xray_service == "active" ]]; then 
   status_xray="${green}ON${NC}"
else
   status_xray="${RED}OFF${NC} "
fi

# RUNNING NGINX
if [[ $nginx_service == "active" ]]; then 
   status_nginx="${green}ON${NC}"
else
   status_nginx="${RED}OFF${NC} "
fi

# RUNNING DROPBEAR
if [[ $dropbear_service == "active" ]]; then 
   status_dropbear="${green}ON${NC}"
else
   status_dropbear="${RED}OF${NC} "
fi
# // UPDATE / REVISI all menu
julak="https://raw.githubusercontent.com/cibut2d/lts/main/menu/"

# // INFO CREATE ACCOUNT
# \\ Vless account //
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx
# \\ Vmess account //
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc
# \\ Trojan account //
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx
# \\ shadowsocks account //
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx
########### // JULAK // BANTUR
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
clear
########### // JULAK // BANTUR
BG_RED="\033[45;1m"
TZ="\033[1;35m___\033[1;34m___\033[1;32m___\033[1;36m___\033[1;37m___\033[1;34m"
vers="${BG_RED}VERSION  JB-03 LITE"
# // JULAK--BANTUR
echo -e " "
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC${COLOR1}                     Premium Autoscript                   $NC${z}│$NC"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC • $NC${z} System OS ${NC}     ${z}=$NC ${COLOR1}$MODEL${NC}"
echo -e " ${z}│$NC • $NC${z} Uptime Server ${NC} ${z}=$NC ${COLOR1}$SERONLINE${NC}"
echo -e " ${z}│$NC • $NC${z} ISP ${NC}           ${z}=$NC ${COLOR1}$ISP${NC}"
echo -e " ${z}│$NC • $NC${z} City ${NC}          ${z}=$NC ${COLOR1}$CITY${NC}"
echo -e " ${z}│$NC • $NC${z} Server RAM ${NC}    ${z}=$NC ${COLOR1}$uram/$RAM MB $NC"
echo -e " ${z}│$NC • $NC${z} Core Cpu ${NC}      ${z}=$NC ${COLOR1}$CORE${NC}"
echo -e " ${z}│$NC • $NC${z} IP VPS ${NC}        ${z}=$NC ${COLOR1}$IPVPS${NC}"
echo -e " ${z}│$NC • $NC${z} Domain ${NC}        ${z}=$NC ${COLOR1}$domain${NC}"
echo -e " ${z}│$NC • $NC${z} Cpu Usage ${NC}     ${z}=$NC ${COLOR1}$cpu_usage${NC}"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e "  ${zx} NGINX$NC : $status_nginx ${zx} WS-EPRO$NC : $status_ws_epro ${zx} DROPBEAR$NC : $status_dropbear ${zx} UDP-CUSTOM$NC : $status_udp   $NC${zx}$NC" 
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e "   SSH : ${green}$ssh1${NC} |"   "VMESS : ${green}$vmc${NC} |"   "VLESS : ${green}$vlx${NC} |"   "TROJAN : ${green}$trx${NC} |"   "SSOCK : ${green}$ssx${NC}"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC   [${zx}01${NC}] ${COLOR1}SSH${VC}                     [${zx}07${NC}] ${COLOR1}CHECK RUNNING${VC} ${z}       │$NC" 
echo -e " ${z}│$NC   [${zx}02${NC}] ${COLOR1}VMESS${VC}                   [${zx}08${NC}] ${COLOR1}CHECK BANDWITH${VC} ${z}      │$NC"    
echo -e " ${z}│$NC   [${zx}03${NC}] ${COLOR1}VLESS${VC}                   [${zx}09${NC}] ${COLOR1}SPEEDTEST${VC} ${z}           │$NC"  
echo -e " ${z}│$NC   [${zx}04${NC}] ${COLOR1}TROJAN${VC}                  [${zx}10${NC}] ${COLOR1}BACKUP/RESTORE${VC} ${z}      │$NC"
echo -e " ${z}│$NC   [${zx}05${NC}] ${COLOR1}SHADOW${VC}                  [${zx}11${NC}] ${COLOR1}ADD BOT${VC} ${z}             │$NC"
echo -e " ${z}│$NC   [${zx}06${NC}] ${COLOR1}SETTING${VC}                 [${zx}12${NC}] ${COLOR1}UPDATE AUTOSCRIPT${VC} ${z}   │$NC"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e "      HARI INI : ${green}$ttoday${NC} KEMARIN : ${green}$tyest${NC} BULAN : ${green}$tmon${NC} $NC"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC${z} AUTHOR$NC          ${z}=$NC ${COLOR1}Julak Bantur${VC}"
echo -e " ${z}│$NC${z} CLIENT$NC          ${z}=$NC ${COLOR1}$username${NC} [${zx}$sts]${NC}"
echo -e " ${z}│$NC${z} EXPIRED SCRIPT$NC  ${z}=$NC ${COLOR1}$exp${NC} / ${zx}$certifacate${NC} Days$NC "
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e "                        VERSION  JB-01 LITE"
echo -e "                        ${TZ} ${NC}"
echo
read -p " Select Options 1/12 : " tangkal
echo -e ""
case $tangkal in
1)
clear
menu-ssh
;;
2)
clear
menu-vmess
;;
3)
clear
menu-vless
;;
4)
clear
menu-trojan
;;
5)
clear
menu-ssws
;;
6)
clear
menu-set
;;
7)
clear
running
;;
8)
clear
bw
;;
9)
clear
speedtest
;;
10)
clear
menu-backup
;;
11)
clear
m-bot
;;
12)
clear
rm -rf update.sh && wget -q ${julak}update.sh && chmod +x update.sh && ./update.sh
;;
*)
clear
menu
;;
esac 
