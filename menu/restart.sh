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
GRENN="\e[92;1m"
WC='\033[0m'
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########
clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  ${COLOR1}Please Wait Loading${NC} \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  ${COLOR1}Please Wait Loading${NC} \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
    /etc/init.d/ssh restart
}
res2() {
    /etc/init.d/stunnel4 restart
}
res3() {
    systemctl restart xray
    systemctl restart xray.service
}
res4() {
    systemctl restart rc-local
}
res5() {
    systemctl restart client
}
res6() {
    systemctl restart server
}
res7() {
    /etc/init.d/dropbear restart
}
res8() {
    systemctl restart edu-proxy.service
    systemctl restart ws-dropbear.service
    systemctl restart ws-stunnel.service
}
res9() {
    /etc/init.d/openvpn restart
}
res10() {
    /etc/init.d/cron restart
}
res11() {
    /etc/init.d/nginx restart
}
res12() {
    systemctl restart netfilter-persistent
}
res13() {
    /etc/init.d/squid restart
}
res14() {
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
}
res15() {
    systemctl restart udp-custom
}
clear
echo -e "$COLOR1 ┌──────────────────────────────────────────┐$NC"
echo -e "$COLOR1 │$NC $COLBG1          RESTART SERVICE SERVE          $NC"
echo -e "$COLOR1 └──────────────────────────────────────────┘$NC"
echo -e ""
echo -e "  ${WH} service restart ssh${NC}"
fun_bar 'res1'
echo -e "  ${WH} service restart stunnel4${NC}"
fun_bar 'res2'
echo -e "  ${WH} service restart xray${NC}"
fun_bar 'res3'
echo -e "  ${WH} service restart rc-local${NC}"
fun_bar 'res4'
echo -e "  ${WH} service restart client dns${NC}"
fun_bar 'res5'
echo -e "  ${WH} service restart server dns${NC}"
fun_bar 'res6'
echo -e "  ${WH} service restart dropbear${NC}"
fun_bar 'res7'
echo -e "  ${WH} service restart websocket${NC}"
fun_bar 'res8'
echo -e "  ${WH} service restart openvpn${NC}"
fun_bar 'res9'
echo -e "  ${WH} service restart cron${NC}"
fun_bar 'res10'
echo -e "  ${WH} service restart nginx${NC}"
fun_bar 'res11'
echo -e "  ${WH} service restart iptables${NC}"
fun_bar 'res12'
#echo -e "  ${WH} service restart squid${NC}"
#fun_bar 'res13'
echo -e "  ${WH} service restart badvpn${NC}"
fun_bar 'res14'
echo -e "  ${WH} service restart Udp Custom${NC}"
fun_bar 'res15'