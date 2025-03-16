#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
y="\033[1;93m"
g="\e[1;92m"
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#! " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "${y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "        $g Edit Limit IP Trojan       ${NC}"
echo -e "${y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "You have no existing clients!"
echo ""
echo -e "${y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-trojan
	fi

clear
echo -e "${y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "        $g Edit Limit IP Trojan       ${NC}"
echo -e "${y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
echo ""
echo -e "${y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	read -rp "Input Username : " user
if [ -z $user ]; then
m-trojan
else
rm -f /etc/cbt/limit/trojan/ip/${user}
read -p "Limit User (IP): " iplim

mkdir -p /etc/cbt/limit/trojan/ip
echo ${iplim} >> /etc/cbt/limit/trojan/ip/${user}

systemctl restart xray > /dev/null 2>&1
systemctl restart crons > /dev/null 2>&1
systemctl restart trip > /dev/null 2>&1
clear
load
sleep 2
clear
echo -e "${y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${g}Edit Limit IP Account Trojan Successfully ${NC}"
echo -e "${y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo " Username    : $user"
echo " Jumlah Limit IP: $iplim"
echo ""
echo -e "${y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-trojan
fi
