#!/bin/bash

user="$2"
function ssh(){
	getent passwd ${user}  >/dev/null 2>&1
	userdel -f ${user}  >/dev/null 2>&1
	systemctl restart sshd >/dev/null 2>&1
	systemctl restart ws >/dev/null 2>&1
	rm -f /etc/cbt/limit/ssh/ip/$user
	sed -i "/### $user $exp/,/^},{/d" /etc/ssh/.ssh.db
	rm -f /etc/limit/ssh/$user
	rm -f /var/www/html/ssh-$user.txt
}
function vmess(){
    exp=$(grep -wE "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
	sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
    sed -i "/^### $user $exp/d" /etc/vmess/.vmess.db
	sed -i "/^#vmg $user $exp/,/^},{/d" /etc/xray/config.json
	rm -f /etc/cbt/limit/vmess/ip/$user
	rm -f /etc/limit/vmess/$user
	rm -f /var/www/html/vmess-$user.txt
	systemctl restart xray
}
function vless(){
    exp=$(grep -wE "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
	sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
    sed -i "/^### $user $exp/d" /etc/vless/.vless.db
	sed -i "/^#vlg $user $exp/,/^},{/d" /etc/xray/config.json
	rm -f /etc/cbt/limit/vless/ip/$user
	rm -f /etc/limit/vless/$user
	rm -f /var/www/html/vless-$user.txt
	systemctl restart xray
}
function trojan(){
    exp=$(grep -wE "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
	sed -i "/^#! $user $exp/,/^},{/d" /etc/xray/config.json
    sed -i "/^### $user $exp/d" /etc/trojan/.trojan.db
	sed -i "/^#trg $user $exp/,/^},{/d" /etc/xray/config.json
	rm -f /etc/cbt/limit/trojan/ip/$user
	rm -f /etc/limit/trojan/$user
	rm -f /var/www/html/trojan-$user.txt
	systemctl restart xray
}
function shadowsocks(){
    exp=$(grep -wE "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
	sed -i "/^#ss# $user $exp/,/^},{/d" /etc/xray/config.json
    sed -i "/^### $user $exp/d" /etc/shadowsocks/.shadowsocks.db
	sed -i "/^#sg# $user $exp/,/^},{/d" /etc/xray/config.json
	rm -f /etc/limit/shadowsocks/$user
	rm -f /var/www/html/shadowsocks-$user.txt
	systemctl restart xray
}
if [[ ${1} == "vmess" ]]; then
vmess
elif [[ ${1} == "vless" ]]; then
vless
elif [[ ${1} == "trojan" ]]; then
trojan
elif [[ ${1} == "shadowsocks" ]]; then
shadowsocks
elif [[ ${1} == "ssh" ]]; then
ssh
fi