#!/bin/bash

clear
res1() {
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo -e "\e[33m──────────────────────────────────────────\033[0m"
        echo -e "\E[40;1;37m          LIST MEMBER V2RAY VMESS         \E[0m"
        echo -e "\e[33m──────────────────────────────────────────\033[0m"      
		echo -e ""
		echo -e "You Don't Have a Vmess Account!"
		echo -e ""
        echo -e "\e[33m──────────────────────────────────────────\033[0m"      
		read -n 1 -s -r -p "Press any key to back"
        menu
	fi

	clear
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e "\E[40;1;37m          LIST MEMBER V2RAY VMESS         \E[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
    echo -e "USER          EXPIRED" 
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
	grep -e "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
    echo -e ""
    echo -e "\e[1;31mTap Enter To Go Back\033[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
	read -rp "Input Username : " user
    if [ -z $user ]; then
    menu
    else
    exp=$(grep -wE "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    sed -i "/### $user /{n;s/^/#/}" /etc/xray/config.json
    sed -i "/#vmg $user /{n;s/^/#/}" /etc/xray/config.json
    systemctl restart xray > /dev/null 2>&1
    clear
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e "\E[40;1;37m        LOCK VMESS ACCOUNT SUCCESS        \E[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "${NC}Username Info   : $user"
    echo -e "${NC}Expired Account : $exp"
    echo -e "${NC}Status Locked   : Success"
    echo -e "Terima kasih telah menggunakan script by Julak Bantur."
    echo -e ""
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e ""
    read -n 1 -s -r -p "Press any key to back"
    menu
    fi
}

res2() {
NUMBER_OF_CLIENTS=$(grep -c -E "^#& " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo -e "\e[33m──────────────────────────────────────────\033[0m"
        echo -e "\E[40;1;37m          LIST MEMBER V2RAY VLESS         \E[0m"
        echo -e "\e[33m──────────────────────────────────────────\033[0m"      
		echo -e ""
		echo -e "You Don't Have a Vless Account!"
		echo -e ""
        echo -e "\e[33m──────────────────────────────────────────\033[0m"      
		read -n 1 -s -r -p "Press any key to back"
        menu
	fi

	clear
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e "\E[40;1;37m          LIST MEMBER V2RAY VLESS         \E[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
    echo -e "USER          EXPIRED" 
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
	grep -e "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
    echo -e ""
    echo -e "\e[1;31mTap Enter To Go Back\033[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
	read -rp "Input Username : " user
    if [ -z $user ]; then
    menu
    else
    exp=$(grep -wE "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    sed -i "/#& $user /{n;s/^/#/}" /etc/xray/config.json
    sed -i "/#vlg $user /{n;s/^/#/}" /etc/xray/config.json
    systemctl restart xray > /dev/null 2>&1
    clear
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e "\E[40;1;37m        LOCK VLESS ACCOUNT SUCCESS        \E[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "${NC}Username Info   : $user"
    echo -e "${NC}Expired Account : $exp"
    echo -e "${NC}Status Locked   : Success"
    echo -e "Terima kasih telah menggunakan script by Julak Bantur."
    echo -e ""
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e ""
    read -n 1 -s -r -p "Press any key to back"
    menu
    fi
}

res3() {
NUMBER_OF_CLIENTS=$(grep -c -E "^#! " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo -e "\e[33m──────────────────────────────────────────\033[0m"
        echo -e "\E[40;1;37m         LIST MEMBER V2RAY TROJAN         \E[0m"
        echo -e "\e[33m──────────────────────────────────────────\033[0m"      
		echo -e ""
		echo -e "You Don't Have a Trojan Account!"
		echo -e ""
        echo -e "\e[33m──────────────────────────────────────────\033[0m"      
		read -n 1 -s -r -p "Press any key to back"
        menu
	fi

	clear
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e "\E[40;1;37m         LIST MEMBER V2RAY TROJAN         \E[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
    echo -e "USER          EXPIRED" 
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
	grep -e "^#! " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
    echo -e ""
    echo -e "\e[1;31mTap Enter To Go Back\033[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
	read -rp "Input Username : " user
    if [ -z $user ]; then
    menu
    else
    exp=$(grep -wE "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    sed -i "/#! $user /{n;s/^/#/}" /etc/xray/config.json
    sed -i "/#trg $user /{n;s/^/#/}" /etc/xray/config.json
    systemctl restart xray > /dev/null 2>&1
    clear
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e "\E[40;1;37m        LOCK TROJAN ACCOUNT SUCCESS       \E[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "${NC}Username Info   : $user"
    echo -e "${NC}Expired Account : $exp"
    echo -e "${NC}Status Locked   : Success"
    echo -e "Terima kasih telah menggunakan script by Julak Bantur."
    echo -e ""
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e ""
    read -n 1 -s -r -p "Press any key to back"
    menu
    fi
}

res4() {
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo -e "\e[33m──────────────────────────────────────────\033[0m"
        echo -e "\E[40;1;37m          LIST MEMBER V2RAY VMESS         \E[0m"
        echo -e "\e[33m──────────────────────────────────────────\033[0m"      
		echo -e ""
		echo -e "You Don't Have a Vmess Account!"
		echo -e ""
        echo -e "\e[33m──────────────────────────────────────────\033[0m"      
		read -n 1 -s -r -p "Press any key to back"
        menu
	fi

	clear
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e "\E[40;1;37m          LIST MEMBER V2RAY VMESS         \E[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
    echo -e "USER          EXPIRED" 
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
	grep -e "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
    echo -e ""
    echo -e "\e[1;31mTap Enter To Go Back\033[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
	read -rp "Input Username : " user
    if [ -z $user ]; then
    menu
    else
    exp=$(grep -wE "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    sed -i "/### $user /{n;s/^#//}" /etc/xray/config.json
    sed -i "/#vmg $user /{n;s/^#//}" /etc/xray/config.json
    systemctl restart xray > /dev/null 2>&1
    clear
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e "\E[40;1;37m       UNLOCK VMESS ACCOUNT SUCCESS       \E[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "${NC}Username Info   : $user"
    echo -e "${NC}Expired Account : $exp"
    echo -e "${NC}Status Unlocked : Success"
    echo -e "Terima kasih telah menggunakan script by Julak Bantur."
    echo -e ""
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e ""
    read -n 1 -s -r -p "Press any key to back"
    menu
    fi
}

res5() {
NUMBER_OF_CLIENTS=$(grep -c -E "^#& " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo -e "\e[33m──────────────────────────────────────────\033[0m"
        echo -e "\E[40;1;37m          LIST MEMBER V2RAY VLESS         \E[0m"
        echo -e "\e[33m──────────────────────────────────────────\033[0m"      
		echo -e ""
		echo -e "You Don't Have a Vless Account!"
		echo -e ""
        echo -e "\e[33m──────────────────────────────────────────\033[0m"      
		read -n 1 -s -r -p "Press any key to back"
        menu
	fi

	clear
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e "\E[40;1;37m          LIST MEMBER V2RAY VLESS         \E[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
    echo -e "USER          EXPIRED" 
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
	grep -e "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
    echo -e ""
    echo -e "\e[1;31mTap Enter To Go Back\033[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
	read -rp "Input Username : " user
    if [ -z $user ]; then
    menu
    else
    exp=$(grep -wE "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    sed -i "/#& $user /{n;s/^#//}" /etc/xray/config.json
    sed -i "/#vlg $user /{n;s/^#//}" /etc/xray/config.json
    systemctl restart xray > /dev/null 2>&1
    clear
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e "\E[40;1;37m       UNLOCK VLESS ACCOUNT SUCCESS       \E[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "${NC}Username Info   : $user"
    echo -e "${NC}Expired Account : $exp"
    echo -e "${NC}Status Unlocked : Success"
    echo -e "Terima kasih telah menggunakan script by Julak Bantur."
    echo -e ""
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e ""
    read -n 1 -s -r -p "Press any key to back"
    menu
    fi
}

res6() {
NUMBER_OF_CLIENTS=$(grep -c -E "^#! " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo -e "\e[33m──────────────────────────────────────────\033[0m"
        echo -e "\E[40;1;37m         LIST MEMBER V2RAY TROJAN         \E[0m"
        echo -e "\e[33m──────────────────────────────────────────\033[0m"      
		echo -e ""
		echo -e "You Don't Have a Trojan Account!"
		echo -e ""
        echo -e "\e[33m──────────────────────────────────────────\033[0m"      
		read -n 1 -s -r -p "Press any key to back"
        menu
	fi

	clear
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e "\E[40;1;37m         LIST MEMBER V2RAY TROJAN         \E[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
    echo -e "USER          EXPIRED" 
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
	grep -e "^#! " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
    echo -e ""
    echo -e "\e[1;31mTap Enter To Go Back\033[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m" 
	read -rp "Input Username : " user
    if [ -z $user ]; then
    menu
    else
    exp=$(grep -wE "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    sed -i "/#! $user /{n;s/^#//}" /etc/xray/config.json
    sed -i "/#trg $user /{n;s/^#//}" /etc/xray/config.json
    systemctl restart xray > /dev/null 2>&1
    clear
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e "\E[40;1;37m       UNLOCK TROJAN ACCOUNT SUCCESS      \E[0m"
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "${NC}Username Info   : $user"
    echo -e "${NC}Expired Account : $exp"
    echo -e "${NC}Status Unlocked : Success"
    echo -e "Terima kasih telah menggunakan script by Julak Bantur."
    echo -e ""
    echo -e "\e[33m──────────────────────────────────────────\033[0m"
    echo -e ""
    read -n 1 -s -r -p "Press any key to back"
    menu
    fi
}

clear
echo -e "\e[33m──────────────────────────────────────────\033[0m"
echo -e "\E[40;1;37m       MENU LOCK UNLOCK XRAY ACCOUNT      \E[0m"
echo -e "\e[33m──────────────────────────────────────────\033[0m"
echo -e ""
echo -e "  [\033[1;96m01\E[0m] Lock Vmess Account"
echo -e "  [\033[1;96m02\E[0m] Lock Vless Account"
echo -e "  [\033[1;96m03\E[0m] Lock Trojan Account"
echo -e "  [\033[1;96m04\E[0m] Unlock Vmess Account"
echo -e "  [\033[1;96m05\E[0m] Unlock Vless Account"
echo -e "  [\033[1;96m06\E[0m] Unlock Trojan Account"
echo -e ""
echo -e "\e[33m──────────────────────────────────────────\033[0m"
echo -e ""
read -p "Select From Options ➤ " opt
case $opt in
1) clear ; res1 ; ;;
2) clear ; res2 ; ;;
3) clear ; res3 ; ;;
4) clear ; res4 ; ;;
5) clear ; res5 ; ;;
6) clear ; res6 ; ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Pilihan anda tidak tersedia! " ; sleep 1 ; menu ;;
esac
