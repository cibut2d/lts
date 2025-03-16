#!/bin/bash

# Color
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
RED='\033[0;31m'
green='\e[32m'
PURPLE='\e[35m'
cyan='\e[36m'
LRED='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
blue="\033[0;34m"
Blue="\033[36m"
clear

echo -e "\e[32mloading...\e[0m"
clear

badvpn1=$(systemctl status vmip | grep running | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# STATUS SERVICE  BADVPN 1
if [[ $badvpn1 == "running" ]]; then 
   status_udp1="${GREEN}Online$NC${blue} │$NC"
else
   status_udp1="${RED}Offline${NC} "
fi

# Status cron
cron_status=$(systemctl is-active cron.service)
if [[ $cron_status == "active" ]]; then
    cron_status="${grenbo}Aktif${NC}"
else
    cron_status="${RED}Tidak Aktif${NC}"
fi

echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "Status cron: $cron_status"
echo -e "Status limit ip $status_udp1 "
echo -e "                 MENU ON OFF LIMIT IP              $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "  ${ORANGE}1.${NC} \033[0;36m TURN OFF LIMIT IP VIA HAPUS${NC}"
echo -e "  ${ORANGE}2.${NC} \033[0;36m TURN ON LIMIT IP VIA HAPUS${NC}"
echo -e "  ${ORANGE}3.${NC} \033[0;36m SET TIMES LOCK IP${NC}"
echo -e "  ${ORANGE}4.${NC} \033[0;36m TURN OFF VIA LOCK IP${NC}"
echo -e "  ${ORANGE}5.${NC} \033[0;36m TURN ON LOCK IP${NC}"
echo -e "  ${ORANGE}0.${NC} \033[0;36m Back To Main Menu ${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"

# Fungsi untuk mematikan limit IP
stop_limit_ip() {
    # Matikan layanan vmip, vlip, dan trip
    systemctl stop vmip.service
    systemctl stop vlip.service
    systemctl stop trip.service
}

# Fungsi untuk menyalakan limit IP
start_limit_ip() {
    # Tambahkan script konfigurasi layanan vmip
    # cat >/etc/systemd/system/vmip.service << END
    # Script konfigurasi layanan vmip di sini
    # END

    # Reload daemon dan restart layanan vmip
    systemctl daemon-reload
    systemctl restart vmip
    systemctl enable vmip

    # Tambahkan script konfigurasi layanan vlip
    # cat >/etc/systemd/system/vlip.service << END
    # Script konfigurasi layanan vlip di sini
    # END

    # Reload daemon dan restart layanan vlip
    systemctl daemon-reload
    systemctl restart vlip
    systemctl enable vlip

    # Tambahkan script konfigurasi layanan trip
    # cat >/etc/systemd/system/trip.service << END
    # Script konfigurasi layanan trip di sini
    # END

    # Reload daemon dan restart layanan trip
    systemctl daemon-reload
    systemctl restart trip
    systemctl enable trip

    # Lakukan reboot (opsional, tergantung dari kebutuhan Anda)
    # reboot
}

# Pilihan fungsi
read -p "Select From Options [ 0 - 5 ] : " menu
case $menu in
    1)
        # Panggil fungsi untuk mematikan limit IP
        clear ;
        stop_limit_ip
        ;;
    2)
        # Panggil fungsi untuk menyalakan limit IP
        clear ;
        start_limit_ip
        ;;
    3)
        # Fungsi untuk menetapkan jadwal cron kustom
        clear ;
        echo "Masukkan jadwal cron kustom (contoh 1 untuk 1 menit):"
        read -r custom_cron_schedule
        cat >/etc/cron.d/lock-vmess <<-END
        SHELL=/bin/sh
        PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
        $custom_cron_schedule root /usr/bin/lock-vmess
END
        echo -e "${GREEN}Waktu Banned Akun Telah Di Aktifkan${NC}\n"
        ;;
    4)
        # Panggil fungsi untuk mematikan cron "LOCK-XRAY"
        clear ;
        echo -e "${GREEN}MEMATIKAN CRON LOCK XRAY${NC}\n"
        stop_cron
        ;;
    5)
    # Panggil fungsi untuk menyalakan cron "LOCK-XRAY"
    clear ;
    echo -e "${GREEN}MENYALAKAN CRON XRAY${NC}\n"
    start_cron
    ;;
    0)
        clear ;
        menu
        ;;
    *)
        clear ;
        menu
        ;;
esac
