#!/bin/bash
BURIQ () {
    curl -sS https://raw.githubusercontent.com/cibut2d/reg/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/cibut2d/reg/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/cibut2d/reg/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/cibut2d/reg/main/ip | grep $MYIP | awk '{print $3}')
fi
clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
TIMES="10"
CHATID=`cat /etc/per/id`
KEY=`cat /etc/per/token`
URL="https://api.telegram.org/bot$KEY/sendMessage"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[42m              SSH Ovpn Account           \E[0m"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Username : " LOGIN
read -p "Password : " PASSWD
read -p "Expired (hari): " EXPIRED
IP=$(curl -sS ifconfig.me)
#CITY=$(cat /etc/xray/city)
#PUB=$( cat /etc/slowdns/server.pub )
NS=`cat /etc/xray/dns`
domain=`cat /etc/xray/domain`
useradd -e `date -d "$EXPIRED days" +"%Y-%m-%d"` -s /bin/false -M $LOGIN
exp="$(chage -l $LOGIN | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$PASSWD\n$PASSWD\n"|passwd $LOGIN &> /dev/null

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/ssh/${LOGIN}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^###" | grep -w "${LOGIN}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${LOGIN}\b/d" /etc/ssh/.ssh.db
fi
echo "### ${LOGIN} " >>/etc/ssh/.ssh.db

cat > /etc/julak/public_html/ssh-$LOGIN.txt <<-END
====================================================================
             P R O J E C T  O F  J U L A K - B A N T U R
                       [Papadaan Store]
====================================================================
        https://github.com/julak-bantur/
====================================================================
              Format SSH OVPN Account
====================================================================

Username         : $LOGIN
Password         : $PASSWD
Expired          : $exp
__________________________________
IP               : $IP
Host             : $domain
#Host Slowdns     : ${NS}
#Pub Key          : ${PUB}
#Location         : $CITY
Port OpenSSH     : 39
Port Dropbear    : 109,143
Port Dropbear WS : 109,143
Port SSH WS      : 80
Port SSH SSL WS  : 443
Port SSL/TLS     : 447,8443
Port OVPN WS SSL : 443,1194
Port OVPN SSL    : 443,1194
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200
Proxy Squid 1    : 3128
Proxy Squid 2    : 8000
Proxy Squid 3    : 8080
BadVPN UDP       : 7100-7300
__________________________________
Payload WS: GET http://BUG.COM/ssh-ws HTTP/1.1[crlf]Host: $domain [crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]Connection: Keep-Alive[crlf][crlf]
Payload WSS: GET wss://BUG.COM/ssh-ws HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
__________________________________
#OpenVPN WS SSL : https://$domain:81/$domain-ws-ssl.ovpn
#OpenVPN SSL : https://$domain:81/$domain-ssl.ovpn
#OpenVPN TCP : https://$domain:81/$domain-tcp.ovpn
#OpenVPN UDP : https://$domain:81/$domain-udp.ovpn
#__________________________________
END
TEXT="
<code>───────────────────────────</code>
<code>      SSH OVPN Account     </code>
<code>───────────────────────────</code>
<code>Username         : $LOGIN</code>
<code>Password         : $PASSWD</code>
<code>Expired          : $exp</code>
<code>───────────────────────────</code>
<code>IP               : $IP</code>
<code>Host             : $domain</code>
#<code>Host Slowdns     : ${NS}</code>
#<code>Pub Key          : ${PUB}</code>
#<code>Location         : $CITY</code>
<code>Port OpenSSH     : 22</code>
<code>Port Dropbear    : 109,143</code>
<code>Port Dropbear WS : 109,143</code>
<code>Port DNS         : 443,53</code>
<code>Port SSH WS      : 80</code>
<code>Port SSH SSL WS  : 443</code>
<code>Port SSL/TLS     : 447,8443</code>
<code>Proxy Squid      : 3128</code>
<code>BadVPN UDP       : 7100, 7300, 7300</code>
<code>───────────────────────────</code>
<code>Payload WS: GET http://BUG.COM/ssh-ws HTTP/1.1[crlf]Host: $domain [crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]Connection: Keep-Alive[crlf][crlf]</code>
<code>Payload WSS      : </code><code>GET wss://BUG.COM/ssh-ws HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]</code>
<code>───────────────────────────</code>
<code>Save Link Account: </code>https://$domain:81/ssh-$LOGIN.txt
<code>───────────────────────────</code>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL
clear
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/julak-bantur/user.log
echo -e "\e[42m      SSH OVPN Account     \E[0m" | tee -a /etc/julak-bantur/user.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/julak-bantur/user.log
echo -e "Username         : $LOGIN" | tee -a /etc/julak-bantur/user.log
echo -e "Password         : $PASSWD" | tee -a /etc/julak-bantur/user.log
echo -e "Expired          : $exp" | tee -a /etc/julak-bantur/user.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/julak-bantur/user.log
echo -e "IP               : $IP" | tee -a /etc/julak-bantur/user.log
echo -e "Host             : $domain" | tee -a /etc/julak-bantur/user.log
echo -e "Port OpenSSH     : 39" | tee -a /etc/julak-bantur/user.log
echo -e "Port DNS         : 443, 53 ,22 " | tee -a /etc/julak-bantur/user.log
echo -e "Port Dropbear    : 109,143" | tee -a /etc/julak-bantur/user.log
echo -e "Port Dropbear WS : 109,143" | tee -a /etc/julak-bantur/user.log
echo -e "Port SSH WS      : 80 " | tee -a /etc/julak-bantur/user.log
echo -e "Port SSH SSL WS  : 443" | tee -a /etc/julak-bantur/user.log
echo -e "Port SSL/TLS     : 447,8443" | tee -a /etc/julak-bantur/user.log
echo -e "Proxy Squid      : 3128" | tee -a /etc/julak-bantur/user.log
echo -e "BadVPN UDP       : 7100, 7300, 7300" | tee -a /etc/julak-bantur/user.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/julak-bantur/user.log
echo -e "Payload WS       : GET http://BUG.COM/ssh-ws HTTP/1.1[crlf]Host: $domain [crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]Connection: Keep-Alive[crlf][crlf]"
echo -e "Payload WSS      : GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]" | tee -a /etc/Tarap-Kuhing/user.log
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/julak-bantur/user.log
echo -e "Save Link Account: https://$domain:81/ssh-$LOGIN.txt"
echo -e "\033[1;93m───────────────────────────\033[0m" | tee -a /etc/julak-bantur/user.log
echo -e "" | tee -a /etc/julak-bantur/user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
