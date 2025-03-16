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
tls="$(cat ~/log-install.txt | grep -w "Trojan WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Trojan WS none TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• Add Trojan Account •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"

		read -rp "User: " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
clear
		echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
                echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• Add Trojan Account •             ${NC} $COLOR1 $NC"
                echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
                        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
			read -n 1 -s -r -p "Press any key to back on menu"
			menu-trojan
		fi
	done

read -p "Uuid (Manual): " uuid
echo -e "${COLOR1}(Isi dengan Domain/Host Jika Tidak Ingin Menambahkan Bug)${NC}"
read -p "Bug (Bug Kuota ): " bug
read -p "Expired (days): " masaaktif
read -p "Limit (IP): " iplimit
read -p "Limit (Quota): " Quota
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp $uuid $bug"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#trg '"$user $exp $uuid $bug"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

trojanlink3="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${bug}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${bug}#${user}"
trojanlink2="trojan://${uuid}@${bug}:80?path=%2Ftrojan-ws&security=auto&host=${domain}&type=ws#${user}"

trojan1="$(echo $trojanlink1 | base64 -w 0)"
trojan2="$(echo $trojanlink | base64 -w 0)"
trojan3="$(echo $trojanlink2 | base64 -w 0)"

if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/cbt/limit/trojan/ip
echo -e "$iplimit" > /etc/cbt/limit/trojan/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/trojan/${user}
fi
DATADB=$(cat /etc/trojan/.trojan.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/trojan/.trojan.db
fi
echo "### ${user} ${exp} ${uuid} ${iplimit}" >>/etc/trojan/.trojan.db

TEXT="
<code>──────────────────────</code>
<code>    Xray TROJAN Account</code>
<code>──────────────────────</code>
<code>Remarks       : </code> <code>${user}</code>
<code>Domain        : </code> <code>${domain}</code>
<code>Port TLS      : </code> <code>443</code>
<code>Port None TLS : </code> <code>80</code>
<code>Port GRPC     : </code> <code>443</code>
<code>User ID       : </code> <code>${uuid}</code>
<code>AlterId       : 0</code>
<code>Security      : auto</code>
<code>Network       : WS or gRPC</code>
<code>Path WS       : </code> <code>/trojan-ws</code>
<code>ServiceName   : </code> <code>trojan-grpc</code>
<code>──────────────────────</code>
<code>Link TLS    :</code> 
<code>${trojan2}</code>
<code>──────────────────────</code>
<code>Link GRPC    :</code> 
<code>${trojan1}</code>
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
echo -e "$COLOR1──────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}${COLBG1}${WH}• XRAY TROJAN •  ${NC} $COLOR1 $NC" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Remarks        ${COLOR1}: ${WH}${user}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Host           ${COLOR1}: ${WH}${domain}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Limit IP       ${COLOR1}: ${WH}${iplimit} Login" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port TLS       ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port none TLS  ${COLOR1}: ${WH}80" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port gRPC      ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Key            ${COLOR1}: ${WH}${uuid}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path WS        ${COLOR1}: ${WH}/trojan-ws" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}ServiceName    ${COLOR1}: ${WH}trojan-grpc" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link TLS ${COLOR1}: ${WH}${trojanlink1}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link None TLS ${COLOR1}: ${WH}${trojanlink2}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link gRPC ${COLOR1}: ${WH}${trojanlink3}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Expired On ${COLOR1}: ${WH}$exp"            | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}${WH}• Julak-Bantur •  ${NC}                 $COLOR1 $NC" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/xray/log-create-${user}.log
echo "" | tee -a /etc/xray/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-trojan