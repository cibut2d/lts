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
Green="\e[92;1m"
RED="\033[31m"
NC='\033[0m'
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/cibut2d/reg/main/ip"
checking_sc() {
    useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
    if [[ $date_list < $useexp ]]; then
        echo -ne
    else
        echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
        echo -e "\033[42m          JULAK BANTUR AUTOSCRIPT          \033[0m"
        echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
        echo -e ""
        echo -e "            ${RED}PERMISSION DENIED !${NC}"
        echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
        echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
        echo -e "             \033[0;33mContact Admin :${NC}"
        echo -e "      \033[0;36mTelegram${NC} t.me/Cibut2d"
        echo -e "      ${GREEN}WhatsApp${NC} wa.me/6281250851741"
        echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
        exit
    fi
}
checking_sc
clear
function add-vmess(){
#author=$(cat /etc/profil)
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domain=`cat /etc/xray/domain`
else
domain=`cat /etc/v2ray/domain`
fi
tls="$(cat ~/log-install.txt | grep -w "Vmess WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess WS none TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}         ${WH}• Add Vmess Account •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"

		read -rp "Name User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
            echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
            echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• Add Vmess Account •              ${NC} $COLOR1 $NC"
            echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
            echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
            echo ""
            echo -e " A client with the specified name was already created, please choose another name."
            echo ""
            echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
            read -n 1 -s -r -p "Press any key to back on menu"
menu-vmess
		fi
	done
echo -e ""
uuid=$(cat /proc/sys/kernel/random/uuid)
echo -e "${COLOR1}(Isi dengan Domain/Host Jika Tidak Ingin Menambahkan Bug)${NC}"
read -p "Bug (Bug Kuota ): " bug
read -p "Expired (days): " masaaktif
read -p "Limit (IP): " iplimit
read -p "Limit (Quota): " Quota
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp $uuid $bug"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\#vmg '"$user $exp $uuid $bug"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls",
      "sni": "${bug}"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${bug}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls",
      "sni": "${bug}"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"

if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/cbt/limit/vmess/ip
echo -e "$iplimit" > /etc/cbt/limit/vmess/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vmess/${user}
fi

DATADB=$(cat /etc/vmess/.vmess.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo "### ${user} ${exp} ${uuid} ${iplimit}" >>/etc/vmess/.vmess.db

TEXT="
<code>──────────────────────</code>
<code>    Xray/Vmess Account</code>
<code>──────────────────────</code>
<code>Remarks      : </code> <code>${user}</code>
<code>Domain       : </code> <code>${domain}</code>
<code>Limit IP     : </code> <code>${iplimit} Login</code>
<code>Port TLS     : </code> <code>443</code>
<code>Port NTLS    : </code> <code>80</code>
<code>Port GRPC    : </code> <code>443</code>
<code>User ID      : </code> <code>${uuid}</code>
<code>AlterId      : 0</code>
<code>Security     : auto</code>
<code>Network      : WS or gRPC</code>
<code>Path         : </code> <code>/vmess</code>
<code>ServiceName  : </code> <code>vmess-grpc</code>
<code>──────────────────────</code>
<code>Link TLS     :</code> 
<code>${vmesslink1}</code>
<code>──────────────────────</code>
<code>Link NTLS    :</code> 
<code>${vmesslink2}</code>
<code>──────────────────────</code>
<code>Link GRPC    :</code> 
<code>${vmesslink3}</code>
<code>──────────────────────</code>
<code>Expired On   : $exp</code>
<code>──────────────────────</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

clear
clear
clear
clear
systemctl restart xray > /dev/null 2>&1
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}   ${COLBG1}${WH}• XRAY VMESS •    ${NC} $COLOR1 $NC" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Remarks        ${COLOR1}: ${WH}${user}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Domain         ${COLOR1}: ${WH}${domain}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Limit IP      ${COLOR1} : ${WH}${iplimit} Login" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port TLS       ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port none TLS  ${COLOR1}: ${WH}80" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port gRPC      ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}id             ${COLOR1}: ${WH}${uuid}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}alterId        ${COLOR1}: ${WH}0" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Security       ${COLOR1}: ${WH}auto" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Network        ${COLOR1}: ${WH}ws" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path           ${COLOR1}: ${WH}/vmess" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}ServiceName    ${COLOR1}: ${WH}vmess-grpc" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket TLS      ${WH}:${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vmesslink1}${NC}"  | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket None TLS ${WH}: ${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vmesslink2}${NC}"  | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket GRPC     ${WH}: ${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vmesslink3}${NC}"  | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}${WH}Expired On     ${COLOR1}: ${WH}$exp" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1┌────────────────────────┐${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}   ${WH}• Julak-Bantur •${NC}    $COLOR1 $NC" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1└────────────────────────┘${NC}" | tee -a /etc/xray/log-create-${user}.log
echo "" | tee -a /etc/xray/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-vmess
}
function trial-vmess(){
clear
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=$(cat /etc/xray/domain)
#author=$(cat /etc/profil)
tls="$(cat ~/log-install.txt | grep -w "Vmess WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess WS none TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=10
exp=`date -d "$masaaktif Minutes"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif Minutes"`
sed -i '/#vmessgrpc$/a\#vmg '"$user $exp $uuid"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"

TEXT="
<code>───────────────────────</code>
<code>    Xray/Vmess Account</code>
<code>───────────────────────</code>
<code>Remarks      : </code> <code>${user}</code>
<code>Domain       : </code> <code>${domain}</code>
<code>Port TLS     : </code> <code>443</code>
<code>Port NTLS    : </code> <code>80</code>
<code>Port GRPC    : </code> <code>443</code>
<code>User ID      : </code> <code>${uuid}</code>
<code>AlterId      : 0</code>
<code>Security     : auto</code>
<code>Network      : WS or gRPC</code>
<code>Path         : </code> <code>/vmess</code>
<code>ServiceName  : </code> <code>vmess-grpc</code>
<code>──────────────────────</code>
<code>Link TLS     :</code> 
<code>${vmesslink1}</code>
<code>──────────────────────</code>
<code>Link NTLS    :</code> 
<code>${vmesslink2}</code>
<code>──────────────────────</code>
<code>Link GRPC    :</code> 
<code>${vmesslink3}</code>
<code>──────────────────────</code>
<code>Expired On   : $exp</code>
<code>──────────────────────</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

clear
clear
clear
clear
clear
systemctl restart xray > /dev/null 2>&1
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}   ${COLBG1}${WH}• XRAY VMESS •    ${NC} $COLOR1 $NC" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Remarks        ${COLOR1}: ${WH}${user}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Domain         ${COLOR1}: ${WH}${domain}" | tee -a /etc/xray/log-create-${user}.log
#echo -e "$COLOR1 ${NC} ${WH}Limit IP      ${COLOR1}: ${WH}${iplimit} Login" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port TLS       ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port none TLS  ${COLOR1}: ${WH}80" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port gRPC      ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}id             ${COLOR1}: ${WH}${uuid}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}alterId        ${COLOR1}: ${WH}0" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Security       ${COLOR1}: ${WH}auto" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Network        ${COLOR1}: ${WH}ws" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path           ${COLOR1}: ${WH}/vmess" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}ServiceName    ${COLOR1}: ${WH}vmess-grpc" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket TLS      ${WH}:${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vmesslink1}${NC}"  | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket None TLS ${WH}: ${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vmesslink2}${NC}"  | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket GRPC     ${WH}: ${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vmesslink3}${NC}"  | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}${WH}Expired On     ${COLOR1}: ${WH}$exp" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1┌────────────────────────┐${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}   ${WH}• Julak-Bantur •${NC}    $COLOR1 $NC" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1└────────────────────────┘${NC}" | tee -a /etc/xray/log-create-${user}.log
echo "" | tee -a /etc/xray/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-vmess
}
function renew-vmess(){
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=$(cat /etc/xray/domain)
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
 	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}        ⇱ Renew Account ⇲        ${NC} $COLOR1 $NC"
  	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo ""
	echo "You have no existing clients!"
	echo ""
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo ""
        read -n 1 -s -r -p "Press any key to back on menu"
        menu-vmess
	fi
 	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}        ⇱ Renew Account ⇲        ${NC} $COLOR1 $NC"
  	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
user=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/xray/config.json
sed -i "s/#vmg $user $exp/#vmg $user $exp4/g" /etc/xray/config.json
sed -i "s/### $user $exp/### $user $exp4/g" /etc/vmess/.vmess.db
clear
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>   XRAY VMESS RENEW</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN   :</b> <code>${domain} </code>
<b>USERNAME :</b> <code>$user </code>
<b>EXPIRED  :</b> <code>$exp4 </code>
<code>◇━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

systemctl restart xray > /dev/null 2>&1
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " VMESS Account Was Successfully Renewed"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo " Client Name : $user"
    echo " Expired On  : $exp4"
    echo ""
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    menu-vmess
}
function del-vmess(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo -e "$COLOR1 ${NC}${COLBG1}     ⇱ Delete  Account ⇲       ${NC} $COLOR1 $NC"
      		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		read -n 1 -s -r -p "Press any key to back on menu"
        menu-vmess
	fi

	clear
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}     ⇱ Delete  Account ⇲       ${NC} $COLOR1 $NC"
      	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo "     No  Expired   User"
	grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^#vmg $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/vmess/.vmess.db
rm -rf /etc/vmess/$user
rm -rf /etc/cbt/limit/vmess/ip/$user
clear
systemctl restart xray > /dev/null 2>&1
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Vmess Account Deleted Successfully"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Client Name : $user"
    echo " Expired On  : $exp"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    menu-vmess
}

function cek-vmess(){
clear
function con() {
    local -i bytes=$1;
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes}B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$(( (bytes + 1023)/1024 ))KB"
    elif [[ $bytes -lt 1073741824 ]]; then
        echo "$(( (bytes + 1048575)/1048576 ))MB"
    else
        echo "$(( (bytes + 1073741823)/1073741824 ))GB"
    fi
}
echo -n > /tmp/other.txt
data=( $(cat /etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq) )
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " \e[1;97;101m           CEK VMESS ACCOUNT            \e[0m"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
for akun in "${data[@]}"
do
    if [[ -z "$akun" ]]; then
        akun="tidakada"
    fi
    echo -n > /tmp/ipvmess.txt
    data2=( $(cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq) )
    for ip in "${data2[@]}"
    do
        jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
        if [[ "$jum" = "$ip" ]]; then
            echo "$jum" >> /tmp/ipvmess.txt
        else
            echo "$ip" >> /tmp/other.txt
        fi
        jum2=$(cat /tmp/ipvmess.txt)
        sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
    done
    jum=$(cat /tmp/ipvmess.txt)
    if [[ -z "$jum" ]]; then
        echo > /dev/null
    else
        iplimit=$(cat /etc/cbt/limit/vmess/ip/${akun} 2>/dev/null)
        jum2=$(cat /tmp/ipvmess.txt | wc -l 2>/dev/null)
        byte=$(cat /etc/vmess/${akun} 2>/dev/null)
        lim=$(con ${byte} 2>/dev/null)
        wey=$(cat /etc/limit/vmess/${akun} 2>/dev/null)
        gb=$(con ${wey} 2>/dev/null)
        lastlogin=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 2 | tail -1 2>/dev/null)
        echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "$COLOR1${NC} USERNAME : \033[0;33m${akun}";
        echo -e "$COLOR1${NC}  LOGIN      : \033[0;33m$lastlogin";
        echo -e "$COLOR1${NC} USAGE QUOTA : \033[0;33m${gb}";
        echo -e "$COLOR1${NC} LIMIT QUOTA : \033[0;33m${lim}";
        echo -e "$COLOR1${NC} LIMIT IP    : \033[0;33m$iplimit";
        echo -e "$COLOR1${NC} LOGIN IP    : \033[0;33m$jum2";
        echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        fi 
    rm -rf /tmp/ipvmess.txt
done
rm -rf /tmp/other.txt
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
}
function list-vmess(){
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess Ws None Tls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
                echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo -e "$COLOR1 ${NC}${COLBG1}    ⇱ CHECK VMESS CONFIG ⇲     ${NC} $COLOR1 $NC"
                echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                read -n 1 -s -r -p "Press any key to back on menu"
        menu-vmess
	fi
	clear
	echo ""
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC}${COLBG1}    ⇱ CHECK VMESS CONFIG ⇲     ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo " Select the existing client to view the config"
        echo " Press CTRL+C to return"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo "     No  Expired   User"
	grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
clear
user=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=$(cat /etc/xray/domain)
#author=$(cat /etc/profil)
uuid=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
bug=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls",
      "sni": "${bug}"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${bug}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls",
      "sni": "${bug}"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
clear
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}   ${COLBG1}${WH}• XRAY VMESS •    ${NC} $COLOR1 $NC" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Remarks        ${COLOR1}: ${WH}${user}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Domain         ${COLOR1}: ${WH}${domain}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port TLS       ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port none TLS  ${COLOR1}: ${WH}80" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port gRPC      ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}id             ${COLOR1}: ${WH}${uuid}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}alterId        ${COLOR1}: ${WH}0" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Security       ${COLOR1}: ${WH}auto" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Network        ${COLOR1}: ${WH}ws" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path           ${COLOR1}: ${WH}/vmess" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}ServiceName    ${COLOR1}: ${WH}vmess-grpc" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket TLS      ${WH}:${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vmesslink1}${NC}"  | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket None TLS ${WH}: ${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vmesslink2}${NC}"  | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${COLOR1}Link Websocket GRPC     ${WH}: ${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1${NC}${WH}${vmesslink3}${NC}"  | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}${WH}Expired On     ${COLOR1}: ${WH}$exp" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1──────────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1┌────────────────────────┐${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}   ${WH}• Julak-Bantur •${NC}    $COLOR1 $NC" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1└────────────────────────┘${NC}" | tee -a /etc/xray/log-create-${user}.log
echo "" | tee -a /etc/xray/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-vmess
}
clear
clear
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC${COLOR1}                     MENU VMESS MANAGER                   $NC${z}│$NC"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC [${zx}01${NC}] ${COLOR1}ADD VMESS$NC" 
echo -e " ${z}│$NC [${zx}02${NC}] ${COLOR1}RENEW VMESS$NC" 
echo -e " ${z}│$NC [${zx}03${NC}] ${COLOR1}DELETE VMESS$NC" 
echo -e " ${z}│$NC [${zx}04${NC}] ${COLOR1}CHECK USER LOGIN$NC" 
echo -e " ${z}│$NC [${zx}05${NC}] ${COLOR1}MEMBER VMESS$NC" 
echo -e " ${z}│$NC [${zx}06${NC}] ${COLOR1}TRIAL VMESS$NC" 
echo -e " ${z}│$NC [${zx}07${NC}] ${COLOR1}ADD VMESS MANUAL UUID$NC" 
echo -e " ${z}│$NC [${zx}08${NC}] ${COLOR1}CHANGE LIMIT IP$NC" 
echo -e " ${z}│$NC [${zx}09${NC}] ${COLOR1}CHANGE LIMIT QUOTA$NC" 
echo -e " ${z}│$NC [${zx}00${NC}] ${COLOR1}BACK TO MENU$NC" 
echo -e " ${z}│$NC [${zx}99${NC}] ${COLOR1}EXIT$NC" 
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; add-vmess ;;
02 | 2) clear ; renew-vmess ;;
03 | 3) clear ; del-vmess ;;
04 | 4) clear ; cek-vmess ;;
05 | 5) clear ; list-vmess ;;
06 | 6) clear ; trial-vmess ;;
07 | 7) clear ; add-vms ;;
08 | 8) clear ; limws ;;
09 | 9) clear ; qvms ;;
00 | 0) clear ; menu ;;
xx | x) clear ; exit ;;
*) clear ; menu-vmess ;;
esac
