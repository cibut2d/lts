#!/bin/bash
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
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• CHANGE LIMIT •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo ""
read -p "Masukkan nama pengguna: " user
limit_file="/etc/cbt/limit/ssh/ip/$user"

# Validasi apakah file batasan IP sudah ada
if [ -e "$limit_file" ]; then
  current_iplimit=$(cat "$limit_file")
  echo "Batasan IP saat ini untuk pengguna $user: $current_iplimit"
  
  read -p "Masukkan batasan IP baru: " new_iplimit

  # Validasi jika masukan kosong
  if [ -z "$new_iplimit" ]; then
    echo "Masukan tidak valid. Batasan IP tidak berubah."
  else
    echo "$new_iplimit" > "$limit_file"
    echo "Batasan IP berhasil diubah menjadi $new_iplimit untuk pengguna $user."
  fi
else
  echo "File batasan IP tidak ditemukan untuk pengguna $user."
fi
