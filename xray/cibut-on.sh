#!/bin/bash

g="\e[92;1m"
RED="\033[31m"
NC='\033[0m'
y='\033[1;93m'

LIMITSSH_SCRIPT="/usr/bin/limitssh-ip"
CRON_FILE="/etc/cron.d/limitssh-ip"

check_cron_status() {
    if [ -e "$CRON_FILE" ]; then
        echo -e "Status Limit IP: ${g}Aktif${NC}"
    else
        echo -e "Status Limit IP: ${RED}Tidak Aktif${NC}"
    fi
}

start_cron() {
    # Input menit dari pengguna
    read -p "Masukkan menit untuk cron (1-59): " menit

    # Validasi input
    if [[ ! "$menit" =~ ^[1-9]$|^[1-5][0-9]$ ]]; then
        echo -e "${RED}Input tidak valid.${NC}"
        return
    fi

    # Membuat isi tugas cron
    CRON_ENTRY="*/$menit * * * * root $LIMITSSH_SCRIPT"

    # Menambahkan atau memperbarui tugas cron
    echo -e "SHELL=/bin/sh\nPATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin\n$CRON_ENTRY" | tee "$CRON_FILE" > /dev/null

    # Pastikan izin file dan tugas cron
    chmod +x "$LIMITSSH_SCRIPT"
    chmod 644 "$CRON_FILE"

    # Menampilkan isi dari /etc/cron.d/limitssh-ip
    echo -e "Isi dari $CRON_FILE:"
    cat "$CRON_FILE"

    echo -e "Tugas cron ${g}diaktifkan${NC} dengan menit setiap $menit menit."
}

stop_cron() {
    rm -f "$CRON_FILE"
    echo -e "Tugas cron ${RED}dinonaktifkan${NC}."
}

PS3="Pilih fungsi (1-4): "
options=("Start Limit IP" "Stop Limit IP" "Check Status Limit IP" "Keluar")

echo -e "${y}Status Menu:${NC}"
check_cron_status
echo -e "\n${y}Menu:${NC}"
select opt in "${options[@]}"; do
    case $REPLY in
        1)
            start_cron
            ;;
        2)
            stop_cron
            ;;
        3)
            check_cron_status
            ;;
        4)
            echo "Keluar."
            exit 0
            ;;
        *)
            echo -e "${RED}Pilihan tidak valid.${NC}"
            ;;
    esac
    echo ""
done
