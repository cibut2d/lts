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
g="\e[92;1m"
y='\033[1;93m'
gg='\e[1;77m'
ungu="\033[0;35m"
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
if [[ -e /etc/ssh/.ssh.db ]]; then
echo -ne
else
touch /etc/ssh/.ssh.db
fi

function usernew(){
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
#sldomain=`cat /etc/xray/dns`
#slkey=`cat /etc/slowdns/server.pub`
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
#author=$(cat /etc/profil)
IP=$(curl -sS ifconfig.me);


echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• SSH PANEL MENU •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -p "Username : " user

CLIENT_EXISTS=$(grep -w $user /etc/ssh/.ssh.db | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• SSH PANEL MENU •              ${NC} $COLOR1 $NC"
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu-ssh
  fi
read -p "Password : " PASSWD
read -p "Expired (hari): " EXPIRED
read -p "Limit (IP): " iplimit
read -p "Limit (Quota): " Quota
#limitip
if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/cbt/limit/ssh/ip/
echo -e "$iplimit" > /etc/cbt/limit/ssh/ip/$user
else
echo > /dev/null
fi
clear
clear
expi=`date -d "$EXPIRED days" +"%Y-%m-%d"`
useradd -e `date -d "$EXPIRED days" +"%Y-%m-%d"` -s /bin/false -M $user
exp="$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$PASSWD\n$PASSWD\n"|passwd $user &> /dev/null
echo -e "### $user $expi $PASSWD" >> /etc/ssh/.ssh.db
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

if [ ! -e /etc/ssh ]; then
  mkdir -p /etc/ssh
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/ssh/${user}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/ssh/.ssh.db
fi
echo "### ${user} ${exp} ${iplimit}" >>/etc/ssh/.ssh.db

TEXT="
<code>──────────────────</code>
<code>    SSH OVPN Premium Account   </code>
<code>──────────────────</code>
<code>Username        : </code> <code>$user</code>
<code>Password        : </code> <code>$PASSWD</code>
<code>Expired          : </code> <code>$exp</code>
<code>──────────────────</code>
<code>IP               : </code> <code>$IP</code>
<code>Host             : </code> <code>$domen</code>
<code>Port OpenSSH     : </code> <code>$opensh</code>
<code>Port Dropbear    : </code> <code>$db</code>
<code>Port SSH WS      : </code> <code>80, 8880</code>
<code>Port SSH SSL WS  : </code> <code>$wsssl</code>
<code>Port SSL/TLS     : </code> <code>445,8443</code>
#<code>Port OVPN WS SSL : </code> <code>2086</code>
#<code>Port OVPN SSL    : </code> <code>990</code>
#<code>Port OVPN TCP    : </code> <code>$ovpn</code>
#<code>Port OVPN UDP    : </code> <code>$ovpn2</code>
#<code>Proxy Squid      : </code> <code>3128</code>
<code>BadVPN UDP       : </code> <code>7100, 7300, 7300</code>
<code>───────────────────</code>
<code>SSH UDP  :</code> <code>$domen:1-65535@$user:$PASSWD</code>
<code>Payload WS   : </code> <code>GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]</code>
<code>───────────────────</code>
#<code>OpenVPN SSL      : </code> https://$IP:89/ssl.ovpn
#<code>OpenVPN TCP      : </code> https://$IP:89/tcp.ovpn
#<code>OpenVPN UDP      : </code> https://$IP:89/udp.ovpn
<code>───────────────────</code>
<code>           Julak-Bantur                       </code>
<code>───────────────────</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

if [[ ! -z "${PID}" ]]; then

clear
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}• Ssh Ovpn Account •           ${NC} $COLOR1 $NC" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Username   ${COLOR1}: ${WH}$user"  | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Password   ${COLOR1}: ${WH}$PASSWD" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Expired    ${COLOR1}: ${WH}$exp"  | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}IP               ${COLOR1}: ${WH}$IP" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Host             ${COLOR1}: ${WH}$domen" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Limit IP         ${COLOR1}: ${WH}${iplimit} Login" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}OpenSSH          ${COLOR1}: ${WH}22" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Dropbear         ${COLOR1}: ${WH}109, 143" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Port SSH UDP     ${COLOR1}: ${WH}1-65535" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Port SSH WS      ${COLOR1}: ${WH}80" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Port SSH WS/SSL  ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Port SSH SSL/TLS ${COLOR1}: ${WH}447, 8443" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}Port Ovpn TCP    ${COLOR1}: ${WH}1194" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}Port Ovpn UDP    ${COLOR1}: ${WH}2200" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}Port Ovpn SSL    ${COLOR1}: ${WH}990" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}OVPN TCP         ${COLOR1}: ${WH}http://$domen:81/tcp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}OVPN UDP         ${COLOR1}: ${WH}http://$domen:81/udp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}OVPN SSL         ${COLOR1}: ${WH}http://$domen:81/ssl.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}UDPGW            ${COLOR1}: ${WH}7100-7900" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}PORT SLWDNS      ${COLOR1}: ${WH}80,22,53" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}NAMESERVER       ${COLOR1}: ${WH}$sldomain" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}PUB KEY          ${COLOR1}: ${WH}$slkey" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${COLOR1}Payload WS & WSS :                                      ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}GET wss:///$domen/ [protocol][crlf]Host: bug.mu[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${COLOR1}SSH UDP CUSTOM   :                  ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}$domen:1-65535@$user:$PASSWD${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 ${NC}  ${WH}• Julak-Bantur •${NC}    $COLOR1 $NC" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/xray/log-createssh-${user}.log
else

echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}• Ssh Ovpn Account •           ${NC} $COLOR1 $NC" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Username   ${COLOR1}: ${WH}$user"  | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Password   ${COLOR1}: ${WH}$PASSWD" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Expired On ${COLOR1}: ${WH}$exp"  | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}IP               ${COLOR1}: ${WH}$IP" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Host             ${COLOR1}: ${WH}$domen" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Limit IP         ${COLOR1}: ${WH}${iplimit} Login" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}OpenSSH          ${COLOR1}: ${WH}22" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Dropbear         ${COLOR1}: ${WH}109, 143" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Port SSH UDP     ${COLOR1}: ${WH}1-65535" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Port SSH WS      ${COLOR1}: ${WH}80" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Port SSH WS/SSL  ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}Port SSH SSL/TLS ${COLOR1}: ${WH}447, 8443" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}Port Ovpn TCP    ${COLOR1}: ${WH}1194" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}Port Ovpn UDP    ${COLOR1}: ${WH}2200" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}Port Ovpn SSL    ${COLOR1}: ${WH}990" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}OVPN TCP         ${COLOR1}: ${WH}http://$domen:81/tcp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}OVPN UDP         ${COLOR1}: ${WH}http://$domen:81/udp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}OVPN SSL         ${COLOR1}: ${WH}http://$domen:81/ssl.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}UDPGW            ${COLOR1}: ${WH}7100-7900" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}PORT SLWDNS      ${COLOR1}: ${WH}80,22,53" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}NAMESERVER       ${COLOR1}: ${WH}$sldomain" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "${WH}PUB KEY          ${COLOR1}: ${WH}$slkey" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${COLOR1}Payload WS & WSS :                                      ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}GET wss:///$domen/ [protocol][crlf]Host: bug.mu[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${COLOR1}SSH UDP CUSTOM   :                  ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}$domen:1-65535@$user:$PASSWD${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 ${NC}  ${WH}• Julak-Bantur •${NC}    $COLOR1 $NC" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/xray/log-createssh-${user}.log
fi
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function trial(){
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
#sldomain=`cat /etc/xray/dns`
#slkey=`cat /etc/slowdns/server.pub`
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`
#author=$(cat /etc/profil)

clear
IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`

user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
Menit="10"
PASSWD=1
echo Ping Host
echo Create Akun: $user
sleep 0.5
echo Setting Password: $PASSWD
sleep 0.5
clear
clear
clear
clear
expi=`date -d "$Menit Minutes"`
useradd -e `date -d "$Menit Minutes"` -s /bin/false -M $user
exp="$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$PASSWD\n$PASSWD\n"|passwd $user &> /dev/null
echo -e "### $user $expi $PASSWD" >> /etc/ssh/.ssh.db
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

TEXT="
<code>──────────────────</code>
<code>    SSH OVPN Premium Account   </code>
<code>──────────────────</code>
<code>Username        : </code> <code>$user</code>
<code>Password        : </code> <code>$PASSWD</code>
<code>Expired          : </code> <code>$exp</code>
<code>──────────────────</code>
<code>IP               : </code> <code>$IP</code>
<code>Host             : </code> <code>$domen</code>
<code>Port OpenSSH     : </code> <code>$opensh</code>
<code>Port Dropbear    : </code> <code>$db</code>
<code>Port SSH WS      : </code> <code>80, 8880</code>
<code>Port SSH SSL WS  : </code> <code>$wsssl</code>
<code>Port SSL/TLS     : </code> <code>445, 8443</code>
<code>Port OVPN WS SSL : </code> <code>2086</code>
<code>Port OVPN SSL    : </code> <code>990</code>
<code>Port OVPN TCP    : </code> <code>$ovpn</code>
<code>Port OVPN UDP    : </code> <code>$ovpn2</code>
<code>Proxy Squid        : </code> <code>3128</code>
<code>BadVPN UDP       : </code> <code>7100, 7300, 7300</code>
<code>───────────────────</code>
<code>SSH UDP      :</code> <code>$domen:100-200@$Login:$Pass</code>
<code>Payload WS   : </code> <code>GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]</code>
<code>───────────────────</code>
<code>OpenVPN SSL      : </code> https://$IP:89/ssl.ovpn
<code>OpenVPN TCP      : </code> https://$IP:89/tcp.ovpn
<code>OpenVPN UDP      : </code> https://$IP:89/udp.ovpn
<code>───────────────────</code>
<code>           Julak-Bantur                       </code>
<code>───────────────────</code>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

if [[ ! -z "${PID}" ]]; then

clear
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}• Ssh Ovpn Account •           ${NC} $COLOR1 $NC" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Username   ${COLOR1}: ${WH}$user"  | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Password   ${COLOR1}: ${WH}$PASSWD" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Expired    ${COLOR1}: ${WH}$exp"  | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}IP               ${COLOR1}: ${WH}$IP" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Host             ${COLOR1}: ${WH}$domen" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}OpenSSH          ${COLOR1}: ${WH}22" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Dropbear         ${COLOR1}: ${WH}109, 143" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH UDP     ${COLOR1}: ${WH}1-65535" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS      ${COLOR1}: ${WH}80" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS/SSL  ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH SSL/TLS ${COLOR1}: ${WH}447, 8443" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}Port Ovpn TCP    ${COLOR1}: ${WH}1194" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}Port Ovpn UDP    ${COLOR1}: ${WH}2200" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}Port Ovpn SSL    ${COLOR1}: ${WH}990" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}OVPN TCP         ${COLOR1}: ${WH}http://$domen:81/tcp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}OVPN UDP         ${COLOR1}: ${WH}http://$domen:81/udp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}OVPN SSL         ${COLOR1}: ${WH}http://$domen:81/ssl.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}UDPGW            ${COLOR1}: ${WH}7100-7900" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}PORT SLWDNS      ${COLOR1}: ${WH}80,22,53" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}NAMESERVER       ${COLOR1}: ${WH}$sldomain" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}PUB KEY          ${COLOR1}: ${WH}$slkey" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${COLOR1}Payload WS & WSS :                                      ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}GET wss:///$domen/ [protocol][crlf]Host: bug.mu[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${COLOR1}SSH UDP CUSTOM   :                  ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}$domen:1-65535@$user:$PASSWD${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 ${NC}  ${WH}• Julak-Bantur •${NC}    $COLOR1 $NC" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/xray/log-createssh-${user}.log
else

echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}• Ssh Ovpn Account •           ${NC} $COLOR1 $NC" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Username   ${COLOR1}: ${WH}$user"  | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Password   ${COLOR1}: ${WH}$PASSWD" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Expired    ${COLOR1}: ${WH}$exp"  | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}IP               ${COLOR1}: ${WH}$IP" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Host             ${COLOR1}: ${WH}$domen" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}OpenSSH          ${COLOR1}: ${WH}22" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Dropbear         ${COLOR1}: ${WH}109, 143" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH UDP     ${COLOR1}: ${WH}1-65535" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS      ${COLOR1}: ${WH}80" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS/SSL  ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH SSL/TLS ${COLOR1}: ${WH}447, 8443" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}Port Ovpn TCP    ${COLOR1}: ${WH}1194" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}Port Ovpn UDP    ${COLOR1}: ${WH}2200" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}Port Ovpn SSL    ${COLOR1}: ${WH}990" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}OVPN TCP         ${COLOR1}: ${WH}http://$domen:81/tcp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}OVPN UDP         ${COLOR1}: ${WH}http://$domen:81/udp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}OVPN SSL         ${COLOR1}: ${WH}http://$domen:81/ssl.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}UDPGW            ${COLOR1}: ${WH}7100-7900" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}PORT SLWDNS      ${COLOR1}: ${WH}80,22,53" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}NAMESERVER       ${COLOR1}: ${WH}$sldomain" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}PUB KEY          ${COLOR1}: ${WH}$slkey" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${COLOR1}Payload WS & WSS :                                      ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}GET wss:///$domen/ [protocol][crlf]Host: bug.mu[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${COLOR1}SSH UDP CUSTOM   :                  ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "${WH}$domen:1-65535@$user:$PASSWD${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 ${NC}  ${WH}• Julak-Bantur •${NC}    $COLOR1 $NC" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/xray/log-createssh-${user}.log
fi
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function renew(){
clear
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=$(cat /etc/xray/domain)
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• RENEW USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo "USERNAME          EXP DATE          STATUS"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo "Account number: $JUMLAH user"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -p "Username To Renew 👉 " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "Tambah Masa Aktif 👉 " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$PASSWD\n$PASSWD\n"|passwd $User &> /dev/null
clear
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  SSHWS OVPN RENEW</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN   :</b> <code>${domain} </code>
<b>USERNAME :</b> <code>$User </code>
<b>EXPIRED  :</b> <code>$Expiration_Display </code>
<code>◇━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null


echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• RENEW USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e ""
echo -e " Username   : $User"
echo -e " Days Added : $Days Days"
echo -e " Expires on : $Expiration_Display"
echo -e ""
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function hapus(){
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/ssh/.ssh.db")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• DELETE USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo ""
echo -e " $COLOR Yahhh, Tidak Ada Username Yang Terdaftar ${NC}"
echo ""
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
fi
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• DELETE USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo ""	
echo -e " $COLOR Pilih Nomer User Yang Akan Di Hapus ${NC}"
echo -e " $COLOR Tekan CTRL×C Untuk Membatalkan ${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2-3 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
if [[ ${CLIENT_NUMBER} == '1' ]]; then
read -rp "Select Number [1]: " CLIENT_NUMBER
else
read -rp "Select Number [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
fi
done
Pengguna=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
Days=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $Pengguna $Days/d" /etc/ssh/.ssh.db
if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna > /dev/null 2>&1
        echo -e "User $Pengguna was removed."
else
        echo -e "Failure: User $Pengguna Not Exist."
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function cekconfig(){
clear
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLOR1 ${NC} ${COLBG1}                 ${WH}• MEMBER SSH •                ${NC}$COLOR1$NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo "USERNAME          EXP DATE          STATUS"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo "Account number: $JUMLAH user"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• DETAIL USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo ""
    until [[ $ipvps =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '1' ]]; do
        echo -e " "
        read -rp "Input Username : " user
        CLIENT_EXISTS=$(grep -w $user /etc/ssh/.ssh.db | wc -l)

        if [[ ${CLIENT_EXISTS} == '0' ]]; then
            echo "No customer name available"
        else
            clear
            cat /etc/xray/log-createssh-${user}.log
            exit
        fi
    done
}
function hapuslama(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 ${WH}• MEMBER SSH •                ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo "USERNAME          EXP DATE          STATUS"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo "Account number: $JUMLAH user"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• DELETE USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo ""
read -p "Username SSH to Delete 👉 " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna > /dev/null 2>&1
        exp=$(grep -w "^### $Pengguna" "/etc/ssh/.ssh.db" | cut -d ' ' -f 3 | sort | uniq)
        sed -i "/^### $Pengguna $exp /,/^},{/d" /etc/ssh/.ssh.db
        rm -f /etc/ssh/$Pengguna
        rm -f /etc/cbt/limit/ssh/ip/${Pengguna}
	    rm -f /var/www/html/ssh-$Pengguna.txt
        echo -e "User $Pengguna was removed."
else
        echo -e "Failure: User $Pengguna Not Exist."
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function login(){
clear
echo " "
echo " "

if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi
                
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo -e "\033[1;36m┌──────────────────────────────────────────┐\033[0m"
echo "    ID  |  Username  |  IP Address";
echo -e "\033[1;36m└──────────────────────────────────────────┘\033[0m"
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
            cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
            NUM=`cat /tmp/login-db-pid.txt | wc -l`;
            USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
            IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
            if [ $NUM -eq 1 ]; then
                    echo "$PID - $USER - $IP";
                    fi
done
echo -e "\033[1;36m└──────────────────────────────────────────┘\033[0m"
echo " "
echo -e "\033[1;36m┌──────────────────────────────────────────┐\033[0m"
echo "    ID  |  Username  |  IP Address";
echo -e "\033[1;36m└──────────────────────────────────────────┘\033[0m"
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

for PID in "${data[@]}"
do
            cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
            NUM=`cat /tmp/login-db-pid.txt | wc -l`;
            USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
            IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
            if [ $NUM -eq 1 ]; then
                    echo "$PID - $USER - $IP";
        fi
done
echo -e "\033[1;36m└──────────────────────────────────────────┘\033[0m"
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
echo ""
echo -e "\033[1;36m┌──────────────────────────────────────────┐\033[0m"
echo "    Username  |  IP Address  |  Connected";
echo -e "\033[1;36m└──────────────────────────────────────────┘\033[0m"
            cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-tcp.txt
            cat /tmp/vpn-login-tcp.txt
fi
echo -e "\033[1;36m└──────────────────────────────────────────┘\033[0m"

if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
echo " "
echo -e "\033[1;36m┌──────────────────────────────────────────┐\033[0m"
echo "    Username  |  IP Address  |  Connected";
echo -e "\033[1;36m└──────────────────────────────────────────┘\033[0m"
            cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-udp.txt
            cat /tmp/vpn-login-udp.txt
fi
echo -e "\033[1;36m└──────────────────────────────────────────┘\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}

function member(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC}${COLBG1}                 ${WH}• MEMBER SSH •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo "USERNAME          EXP DATE          STATUS"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo "Account number: $JUMLAH user"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function autokill(){
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^### Autokill" /etc/cron.d/kills)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1${NC}${COLBG1}             AUTOINFO LOGIN SSH          ${NC}$COLOR1$NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Status Autokill : $sts        "
echo -e ""
echo -e "[1]  AutoInfo After 1 Minutes"
echo -e "[2]  AutoInfo After 5 Minutes"
echo -e "[3]  AutoInfo After 10 Minutes"
echo -e "[4]  Turn Off AutoKill/MultiLogin"
echo ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -p "Select From Options [1-4 or x] :  " AutoKill
if [ -z $AutoKill ]; then
autokill-menu
fi
read -p "Multilogin Maximum Number Of Allowed: " max
echo -e ""
case $AutoKill in
                1)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/kills
                echo "### Autokill" >/etc/cron.d/kills
                echo "*/1 * * * *  root /usr/bin/kills $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoInfo Every     : 1 Minutes"
                echo -e ""
                echo -e "======================================"
                service cron restart >/dev/null 2>&1
                service cron reload >/dev/null 2>&1
                ;;
                2)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/kills
                echo "### Autokill" >/etc/cron.d/kills
                echo "*/5 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/kills
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoInfo Every     : 5 Minutes"
                echo -e ""
                echo -e "======================================"
                service cron restart >/dev/null 2>&1
                service cron reload >/dev/null 2>&1
                ;;
                3)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/kills
                echo "### Autokill" >/etc/cron.d/kills
                echo "*/10 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/kills
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoInfo Every     : 10 Minutes"
                echo -e ""
                echo -e "======================================"
                service cron restart >/dev/null 2>&1
                service cron reload >/dev/null 2>&1
                ;;
                4)
                clear
                rm /etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      AutoInfo MultiLogin Turned Off  "
                echo -e ""
                echo -e "======================================"
                service cron restart >/dev/null 2>&1
                service cron reload >/dev/null 2>&1
                ;;
                x)
                clear
                autokill-menu
                ;;
        esac
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function cekudp(){
clear
touch /root/.system
echo -e "  ${y}───────────────────────────────────────${NC}"
echo -e "            ️ ${g}USER LOGIN UDP${NC}  ️"
echo -e "  ${y}───────────────────────────────────────${NC}"
echo -e "    ${ungu} LOGIN IP    LIMIT IP    USERNAME ${NC}"
data=( `cat /etc/passwd | grep home | cut -d ' ' -f 1 | cut -d : -f 1`);
for user in "${data[@]}"
do
cekcek=$(systemctl status udp-custom | grep $user | wc -l)
if [[ $cekcek -gt 0 ]]; then
iplimit=$(cat /etc/kyt/limit/ssh/ip/$user)
printf "  %-13s %-7s %-8s %2s\n" "     ${cekcek} IP        ${iplimit} IP      ${user}"
echo "slot" >> /root/.system
else
echo > /dev/null
fi
sleep 0.1
done
aktif=$(cat /root/.system | wc -l)
echo -e "  ${y}───────────────────────────────────────${NC}"
echo -e "            $aktif User Online"
echo -e "  ${y}───────────────────────────────────────${NC}"
sed -i "d" /root/.system
# Restart UDP service
systemctl restart udp-custom
}
clear
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC${COLOR1}                     MENU SSH MANAGER                     $NC${z}│$NC"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC [${zx}01${NC}] ${COLOR1}ADD SSH$NC" 
echo -e " ${z}│$NC [${zx}02${NC}] ${COLOR1}RENEW SSH$NC" 
echo -e " ${z}│$NC [${zx}03${NC}] ${COLOR1}DELETE SSH$NC" 
echo -e " ${z}│$NC [${zx}04${NC}] ${COLOR1}CHECK USER LOGIN$NC" 
echo -e " ${z}│$NC [${zx}05${NC}] ${COLOR1}MEMBER SSH$NC" 
echo -e " ${z}│$NC [${zx}06${NC}] ${COLOR1}TRIAL SSH$NC" 
echo -e " ${z}│$NC [${zx}07${NC}] ${COLOR1}CHANGE LIMIT IP$NC" 
echo -e " ${z}│$NC [${zx}08${NC}] ${COLOR1}CHECK LOGIN UDP$NC" 
echo -e " ${z}│$NC [${zx}09${NC}] ${COLOR1}SETUP LIMIT IP$NC" 
echo -e " ${z}│$NC [${zx}10${NC}] ${COLOR1}LOCK SSH$NC" 
echo -e " ${z}│$NC [${zx}11${NC}] ${COLOR1}UNLOCK SSH$NC" 
echo -e " ${z}│$NC [${zx}00${NC}] ${COLOR1}BACK TO MENU$NC" 
echo -e " ${z}│$NC [${zx}99${NC}] ${COLOR1}EXIT$NC" 
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
read -p "Select From Options [ 0 - 99 ] : " menu
echo -e ""
case $menu in
1)
    usernew
    ;;
2)
    renew
    ;;
3)
    hapuslama
    ;;
4)
    login
    ;;
5)
    cekconfig
    ;;
6)
    trial
    ;;
7)
    limsh
    ;;
8)
    cekudp
    ;;
9)
    cibut-on
    ;;
10)
    lock
    ;;
11)
    unlock
    ;;
0)
    menu
    ;;
99)
    exit
    ;;
*)
    menu-ssh
    ;;
esac
