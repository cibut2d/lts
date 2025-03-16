#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	Julak Bantur
# //	Dscription: Xray Menu Management
# //	email: putrameratus2@gmail.com
# //  telegram: https://t.me/Cibut2d
# //====================================================
# // font color configuration | JULAK BANTUR AUTOSCRIPT
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
grenbo="\e[92;1m"
GREEN="\e[92;1m"
WC='\033[0m'
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########

ISP=$(cat /etc/xray/isp)
domain=$(cat /etc/xray/domain)
WKT=$(curl -s ipinfo.io/timezone)
IPVPS=$(curl -s ipv4.icanhazip.com)
tram=$(free -m | awk 'NR==2 {print $2}')
swap=$(free -m | awk 'NR==4 {print $2}')
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
Exp=$(curl -sS https://raw.githubusercontent.com/cibut2d/reg/main/ip | grep $IPVPS | awk '{print $3}')
openvpn_service="$(systemctl show openvpn.service --no-page)"
oovpn=$(echo "${openvpn_service}" | grep 'ActiveState=' | cut -f2 -d=)
status_openvp=$(/etc/init.d/openvpn status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
stunnel_service=$(/etc/init.d/stunnel4 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
squid_service=$(/etc/init.d/squid status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
Nginx=$(systemctl status nginx | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wstls=$(systemctl status ws-stunnel.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsdrop=$(systemctl status ws-dropbear.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
udpcustom=$(systemctl status udp-custom | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
if [[ $ssh_service == "running" ]]; then
    status_1="${grenbo}Online${NC}"
else
    status_1="${RED}Offline${NC}"
fi

if [[ $dropbear_status == "running" ]]; then
    status_2="${grenbo}Online${NC}"
else
    status_2="${RED}Offline${NC}"
fi

if [[ $wstls == "running" ]]; then
    status_3="${grenbo}Online${NC}"
else
    status_3="${RED}Offline${NC}"
fi

if [[ $wsdrop == "running" ]]; then
    status_4="${grenbo}Online${NC}"
else
    status_4="${RED}Offline${NC}"
fi

if [[ $oovpn == "active" ]]; then
    status_5="${grenbo}Online${NC}"
else
    status_5="${RED}Offline${NC}"
fi

if [[ $Nginx == "running" ]]; then
    status_6="${grenbo}Online${NC}"
else
    status_6="${RED}Offline${NC}"
fi

if [[ $stunnel_service == "running" ]]; then
    status_7="${grenbo}Online${NC}"
else
    status_7="${RED}Offline${NC}"
fi

if [[ $tls_v2ray_status == "running" ]]; then
    status_8="${grenbo}Online${NC}"
else
    status_8="${RED}Offline${NC}"
fi

if [[ $nontls_v2ray_status == "running" ]]; then
    status_9="${grenbo}Online${NC}"
else
    status_9="${RED}Offline${NC}"
fi

if [[ $vless_tls_v2ray_status == "running" ]]; then
    status_10="${grenbo}Online${NC}"
else
    status_10="${RED}Offline${NC}"
fi

if [[ $vless_nontls_v2ray_status == "running" ]]; then
    status_11="${grenbo}Online${NC}"
else
    status_11="${RED}Offline${NC}"
fi

if [[ $trojan_server == "running" ]]; then
    status_12="${grenbo}Online${NC}"
else
    status_12="${RED}Offline${NC}"
fi

if [[ $squid_service == "running" ]]; then
    status_13="${grenbo}Online${NC}"
else
    status_13="${RED}Offline${NC}"
fi

if [[ $cron_service == "running" ]]; then
    status_14="${grenbo}Online${NC}"
else
    status_14="${RED}Offline${NC}"
fi

if [[ $vnstat_service == "running" ]]; then
    status_15="${grenbo}Online${NC}"
else
    status_15="${RED}Offline${NC}"
fi

if [[ $fail2ban_service == "running" ]]; then
    status_16="${grenbo}Online${NC}"
else
    status_16="${RED}Offline${NC}"
fi

if [[ $udpcustom == "running" ]]; then
    status_18="${grenbo}Online${NC}"
else
    status_18="${RED}Offline${NC}"
fi

echo -e "$COLOR1─────────────────────────────────────${NC}"
echo -e "$COLBG1      ⇱ Subscription Information ⇲   ${NC}"
echo -e "$COLOR1─────────────────────────────────────${NC}"
echo -e "${COLOR1}Operating System${NC}    ${WH}: $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')${NC}"
echo -e "${COLOR1}Total Amount Of RAM${NC} ${WH}: $tram MB${NC}"
echo -e "${COLOR1}Ip Server${NC}           ${WH}: $IPVPS${NC}"
echo -e "${COLOR1}Domain Server${NC}       ${WH}: $(cat /etc/xray/domain)${NC}"
echo -e "${COLOR1}Exp Script${NC}          ${WH}: $Exp${NC}"
echo -e "${COLOR1}Version Script${NC}      ${WH}: JB-01 LITE ${NC}"
echo -e "$COLOR1─────────────────────────────────────${NC}"
echo -e "$COLBG1      ⇱ Service Information ⇲        ${NC}"
echo -e "$COLOR1─────────────────────────────────────${NC}"
echo -e "${WH}Service OpenSSH$NC                ${COLOR1}: $status_1 ${NC}"
echo -e "${WH}Service Dropbear$NC               ${COLOR1}: $status_2 ${NC}"
echo -e "${WH}Service SSH Websocket TLS$NC      ${COLOR1}: $status_3 ${NC}"
echo -e "${WH}Service SSH Websocket None TLS$NC ${COLOR1}: $status_4 ${NC}"
#echo -e "${WH}Service OpenVPN$NC                ${COLOR1}: $status_5 ${NC}"
echo -e "${WH}Service Nginx$NC                  ${COLOR1}: $status_6 ${NC}"
echo -e "${WH}Service Stunnel4$NC               ${COLOR1}: $status_7 ${NC}"
echo -e "${WH}Service Xray Vmess TLS$NC         ${COLOR1}: $status_8 ${NC}"
echo -e "${WH}Service Xray Vmess None TLS$NC    ${COLOR1}: $status_9 ${NC}"
echo -e "${WH}Service Xray Vless TLS$NC         ${COLOR1}: $status_10 ${NC}"
echo -e "${WH}Service Xray Vless None TLS$NC    ${COLOR1}: $status_11 ${NC}"
echo -e "${WH}Service Trojan$NC                 ${COLOR1}: $status_12 ${NC}"
echo -e "${WH}Service Squid$NC                  ${COLOR1}: $status_13 ${NC}"
echo -e "${WH}Service Crons$NC                  ${COLOR1}: $status_14 ${NC}"
echo -e "${WH}Service Vnstat$NC                 ${COLOR1}: $status_15 ${NC}"
echo -e "${WH}Service Fail2Ban$NC               ${COLOR1}: $status_16 ${NC}"
echo -e "${WH}Service UDP Custom$NC             ${COLOR1}: $status_18 ${NC}"
echo -e "$COLOR1─────────────────────────────────────${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
