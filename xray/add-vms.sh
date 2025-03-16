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
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
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
read -p "Uuid (Manual ): " uuid
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