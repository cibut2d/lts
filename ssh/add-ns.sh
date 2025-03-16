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
total_ram=$(grep "MemTotal: " /proc/meminfo | awk '{ print $2}')
totalram=$(($total_ram / 1024))
MYIP=$(curl -sS ipv4.icanhazip.com)
LAST_DOMAIN="$(cat /etc/xray/domain)"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
function cert() {

    echo -e "${GREEN}--->${NC}     Start "
    systemctl stop nginx
    systemctl stop haproxy
    STOPWEBSERVER=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
    systemctl stop $STOPWEBSERVER
    echo -e "${GREEN}--->${NC}     Starting renew cert "
    sleep 2
    echo -e "${GREEN}--->$NC     Getting acme for cert"
    /root/.acme.sh/acme.sh --upgrade --auto-upgrade >/dev/null 2>&1
    /root/.acme.sh/acme.sh --set-default-ca --server letsencrypt >/dev/null 2>&1
    /root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256 >/dev/null 2>&1
    /.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc >/dev/null 2>&1
    echo -e "${GREEN}--->${NC}     Renew cert done "
    sed -i "s/${LAST_DOMAIN}/${domain}/g" /etc/nginx/conf.d/nginx.conf >/dev/null 2>&1
    sed -i "s/${LAST_DOMAIN}/${domain}/g" /etc/public_html/index.html >/dev/null 2>&1
    cat /etc/xray/xray.crt /etc/xray/xray.key >/dev/null 2>&1
    systemctl daemon-reload >/dev/null 2>&1
    systemctl reload server >/dev/null 2>&1
    systemctl reload client >/dev/null 2>&1

    systemctl reload nginx >/dev/null 2>&1
    systemctl restart xray >/dev/null 2>&1
    sleep 2
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"

    menu
}
clear
function add-name() {
    DOMAINNS="julak.tech"
    DAOMIN=$(cat /etc/xray/domain)
    SUB=$(tr </dev/urandom -dc a-z0-9 | head -c6)
    SUB_DOMAIN=${SUB}."julak.tech"
    NS_DOMAIN=ns.${SUB_DOMAIN}
    CF_ID="merahjambo@gmail.com"
    CF_KEY="86431de017f7bf317c3960061da2f87c8effb"
    set -euo pipefail
    IP=$(wget -qO- ipinfo.io/ip)
    ZONE=$(
        curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAINNS}&status=active" \
            -H "X-Auth-Email: ${CF_ID}" \
            -H "X-Auth-Key: ${CF_KEY}" \
            -H "Content-Type: application/json" | jq -r .result[0].id
    )

    RECORD=$(
        curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
            -H "X-Auth-Email: ${CF_ID}" \
            -H "X-Auth-Key: ${CF_KEY}" \
            -H "Content-Type: application/json" | jq -r .result[0].id
    )

    if [[ "${#RECORD}" -le 10 ]]; then
        RECORD=$(
            curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
                -H "X-Auth-Email: ${CF_ID}" \
                -H "X-Auth-Key: ${CF_KEY}" \
                -H "Content-Type: application/json" \
                --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DAOMIN}'","proxied":false}' | jq -r .result.id
        )
    fi

    RESULT=$(
        curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
            -H "X-Auth-Email: ${CF_ID}" \
            -H "X-Auth-Key: ${CF_KEY}" \
            -H "Content-Type: application/json" \
            --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DAOMIN}'","proxied":false}'
    )
    echo $NS_DOMAIN >/etc/xray/dns
    sed -i "s/$NS/$NS_DOMAIN/g" /etc/systemd/system/client.service >/dev/null 2>&1
    sed -i "s/$NS/$NS_DOMAIN/g" /etc/systemd/system/server.service >/dev/null 2>&1
    sleep 2
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"

    menu
}
clear
function nameserver() {
read -p "   Masukan NameServer Kamu : " NS_DOMAIN
echo ""
    echo $NS_DOMAIN >/etc/xray/dns
    sed -i "s/$NS/$NS_DOMAIN/g" /etc/systemd/system/client.service >/dev/null 2>&1
    sed -i "s/$NS/$NS_DOMAIN/g" /etc/systemd/system/server.service >/dev/null 2>&1
    sleep 2
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"

    menu
}
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m        • CHANGE DOMAIN MENU •            \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "" 
echo -e " [\e[36m•1\e[0m] GANTI DOMAIN VPS"
echo -e " [\e[36m•2\e[0m] GANTI NS DENGAN AUTO ADMIN"
echo -e " [\e[36m•3\e[0m] GANTI NS PUNYAMU SENDIRI"
echo -e " [\e[36m•4\e[0m] PERBAHARUI SERTIFIKAT DOMAIN"
echo -e   ""
echo -e   "Press [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -p "   Please select numbers 1-2 or Any Button(Random) : " julak
echo ""
if [[ $julak == "1" ]]; then
read -rp "Input your domain : " -e bantur
echo $bantur > /root/domain
echo $bantur > /etc/v2ray/domain
echo $bantur >/etc/xray/domain
echo "IP=$bantur" > /var/lib/ipvps.conf
cert
echo ""
elif [[ $julak == "2" ]]; then
add-name
elif [[ $julak == "3" ]]; then
nameserver
elif [[ $julak == "4" ]]; then
cert
