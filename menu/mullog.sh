#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	Julak Bantur
# //	Dscription: Xray MultiPort
# //	email: putrameratus2@gmail.com
# //  telegram: https://t.me/Cibut2d
# //====================================================
# // font color configuration | JULAK BANTUR AUTOSCRIPT
function send_log(){
    CHATID=$(cat /etc/per/id)
    KEY=$(cat /etc/per/token)
    TIME="10"
    URL="https://api.telegram.org/bot$KEY/sendMessage"
    TEXT="
<code>────────────────────</code>
<b>⚠️ NOTIFICATIONS MULTI LOGIN SSH ⚠️</b>
<code>────────────────────</code>
<code>Username  : </code><code>$user</code>
<code>Limit Ip    : </code><code>${iplimit}</code>
<code>Login Ip    : </code><code>${cekcek}</code>
<code>────────────────────</code>
"
    curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
clear
mulog=$(cekssh)
date=$(date)
data=( `ls /etc/cbt/limit/ssh/ip`);
for user in "${data[@]}"
do
iplimit=$(cat /etc/cbt/limit/ssh/ip/$user)
cekcek=$(echo -e "$mulog" | grep $user | wc -l);
if [[ $cekcek -gt $iplimit ]]; then
passwd -l $user
nais=3
else
echo > /dev/null
fi
sleep 0.1
done
if [[ $nais -gt 1 ]]; then
send_log > /dev/null & 
else
echo > /dev/null
fi
