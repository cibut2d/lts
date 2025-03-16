#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
export NC="\e[0m"
export YELLOW='\033[0;33m';
export RED="\033[0;31m"
export COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########

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
yellow='\033[0;33m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
IP=$(wget -qO- ipinfo.io/ip);
domain=$(cat /etc/xray/domain)
date=$(date +"%Y-%m-%d")
email=$(cat /root/email)
if [[ "$email" = "" ]]; then
echo -e "${YELLOW} Masukkan Email Untuk Menerima Backup ${NC}"
read -rp "Email : " -e email
cat <<EOF>>/root/email
$email
EOF
fi
clear
echo -e "\033[0;33m Mohon Menunggu , Proses Backup sedang berlangsung !!! \033[0m"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp /etc/cbt backup/
cp -r /var/lib/ backup/
echo -e "\033[0;33m Proses Backup Xray \033[0m"
echo ""
cp -r /etc/xray backup/xray
cp -r /etc/per backup/per
#echo -e "\033[0;33m Proses Backup Slowdns \033[0m"
#cp -r /etc/slowdns backup/slowdns
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"

echo -e "
====================≈===============
         Detail Backup 
               By
        PAPADA'AN STORE 
====================================
IP VPS        : $IP
Toke ID       : $id
Tanggal       : $date
====================================
" | mail -s "Backup Data " $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
echo ""
clear
echo -e "
==================================
         Detail Backup 
               By
        PAPADA'AN STORE
==================================
IP VPS        : $IP
Token ID      : $id
Tanggal       : $date
==================================
"
message="
<code>===========================</code>
<code>      Detail Backup    </code>
<code>==========================</code>
<code>      PAPADA'AN STORE   </code>
<code>===========================</code>
<code>DOMAIN        : ${domain}</code>
<code>=========================/=</code>
<code>IP VPS        : ${IP}</code>
<code>===========================</code>
<code>Token ID      :</code> $id
<code>===========================</code>
<code>Tanggal       : $date</code>
<code>===========================</code>
"
curl -s -X POST "$LINK" \
-d "chat_id=$CHATID" -d "parse_mode=html" -d "text=$message" >/dev/null 2>&1
echo -e "\033[0;33m Cek Email Kamu Link Backup Sudah Dikirim \033[0m"
echo -e "\033[0;33m               Atau  ${NC}"
echo -e "\033[0;33m Copy Token ID Di Atas Dan Restore Di VPS Baru \033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
