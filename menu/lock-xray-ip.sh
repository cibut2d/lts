#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	Julak Bantur
# //	Dscription: Xray MultiPort
# //	email: putrameratus2@gmail.com
# //  telegram: https://t.me/Cibut2d
# //====================================================
# // font color configuration | JULAK BANTUR AUTOSCRIPT

LOCK_FILE="/tmp/multi_login_lock"

function is_locked() {
    [[ -e "$LOCK_FILE" ]]
}

function lock() {
    touch "$LOCK_FILE"
}

function unlock() {
    rm -f "$LOCK_FILE"
}

function send_log() {
    CHATID=$(cat /etc/per/id)
    KEY=$(cat /etc/per/token)
    TIME="10"
    URL="https://api.telegram.org/bot$KEY/sendMessage"
    TEXT="
<code>────────────────────</code>
<b>⚠️ NOTIFICATIONS MULTI LOGIN ($protocol) ⚠️</b>
<code>────────────────────</code>
<code>Username  : </code><code>$user</code>
<code>Limit Ip    : </code><code>${iplimit}</code>
<code>Login Ip    : </code><code>${cekcek}</code>
<code>────────────────────</code>
"
    curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

function vmip() {
    if is_locked; then
        echo "Akun terkunci. Tunggu 15 menit."
        exit 0
    fi

    lock

    echo -n > /var/log/xray/access.log
    sleep 440
    data=( $(ls /etc/cbt/limit/vmess/ip) )

    for user in "${data[@]}"; do
        iplimit=$(cat /etc/cbt/limit/vmess/ip/$user)
        ehh=$(cat /var/log/xray/access.log | grep "$user" | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq)
        cekcek=$(echo -e "$ehh" | wc -l)

        if [[ $cekcek -gt $iplimit ]]; then
            exp=$(grep -w "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
            sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
            sed -i "/^#vmg $user $exp/,/^},{/d" /etc/xray/config.json
            sed -i "/^### $user $exp/d" /etc/vmess/.vmess.db
            systemctl restart xray >> /dev/null 2>&1
            jum2=$(cat /tmp/ipvmess.txt | wc -l)
            rm -rf /etc/cbt/limit/vmess/ip/$user
            send_log
        else
            echo ""
        fi
        sleep 0.1
    done

    sleep 900  # Tidur selama 15 menit
    unlock
}

function vlip() {
    if is_locked; then
        echo "Akun terkunci. Tunggu 15 menit."
        exit 0
    fi

    lock

    echo -n > /var/log/xray/access.log
    sleep 440
    data=( $(ls /etc/cbt/limit/vless/ip) )

    for user in "${data[@]}"; do
        iplimit=$(cat /etc/cbt/limit/vless/ip/$user)
        ehh=$(cat /var/log/xray/access.log | grep "$user" | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq)
        cekcek=$(echo -e "$ehh" | wc -l)

        if [[ $cekcek -gt $iplimit ]]; then
            exp=$(grep -w "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
            sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
            sed -i "/^#vlg $user $exp/,/^},{/d" /etc/xray/config.json
            sed -i "/^### $user $exp/d" /etc/vless/.vless.db
            systemctl restart xray >> /dev/null 2>&1
            jum2=$(cat /tmp/ipvless.txt | wc -l)
            rm -rf /etc/cbt/limit/vless/ip/$user
            send_log
        else
            echo ""
        fi
        sleep 0.1
    done

    sleep 900  # Tidur selama 15 menit
    unlock
}

function trip() {
    if is_locked; then
        echo "Akun terkunci. Tunggu 15 menit."
        exit 0
    fi

    lock

    echo -n > /var/log/xray/access.log
    sleep 440
    data=( $(ls /etc/cbt/limit/trojan/ip) )

    for user in "${data[@]}"; do
        iplimit=$(cat /etc/cbt/limit/trojan/ip/$user)
        ehh=$(cat /var/log/xray/access.log | grep "$user" | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq)
        cekcek=$(echo -e "$ehh" | wc -l)

        if [[ $cekcek -gt $iplimit ]]; then
            exp=$(grep -w "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
            sed -i "/^#! $user $exp/,/^},{/d" /etc/xray/config.json
            sed -i "/^#trg $user $exp/,/^},{/d" /etc/xray/config.json
            sed -i "/^### $user $exp/d" /etc/trojan/.trojan.db
            systemctl restart xray >> /dev/null 2>&1
            jum2=$(cat /tmp/iptrojan.txt | wc -l)
            rm -rf /etc/cbt/limit/trojan/ip/$user
            send_log
        else
            echo ""
        fi
        sleep 0.1
    done

    sleep 900  # Tidur selama 15 menit
    unlock
}

if [[ ${1} == "vmip" ]]; then
    vmip
elif [[ ${1} == "vlip" ]]; then
    vlip
elif [[ ${1} == "trip" ]]; then
    trip
fi
