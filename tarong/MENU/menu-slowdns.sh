#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/tarap/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/tarap/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/tarap/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########

BURIQ () {
    curl -sS https://raw.githubusercontent.com/Tarap-Kuhing/Profile/main/Profile/permission/ip > /root/tmp
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
Name=$(curl -sS https://raw.githubusercontent.com/Tarap-Kuhing/Profile/main/Profile/permission/ip | grep $MYIP | awk '{print $2}')
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
    IZIN=$(curl -sS https://raw.githubusercontent.com/Tarap-Kuhing/Profile/main/Profile/permission/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
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
echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%40s%s%-12s\n' "MENU SLOWDNS MANAGER" ; tput sgr0
echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
echo -e "\033[0;36m#===================================================#\033[m"
echo -e "\033[0;36m# .|'''.|'||                '||''|. '|.   '|'.|'''.|#\033[m"
echo -e "\033[0;36m# ||..  ' ||  ... ... ... ...||   || |'|   | ||..  '#\033[m"
echo -e "\033[0;36m#  ''|||. ||.|  '|.||  ||  | ||    ||| '|. |  ''|||.#\033[m"
echo -e "\033[0;36m#.     '||||||   || ||| |||  ||    |||   |||.     '|#\033[m"
echo -e "\033[0;36m#|'....|'.||.'|..|'  |   |  .||...|'.|.   '||'....|'#\033[m"
echo -e "\033[0;36m#---------------------------------------------------#\033[m"
echo -e "\033[0;36m#\033[m \033[0;31mSlowDNS | SANTAI\033[m \033[0;36m#\033[m"
echo -e "\033[0;36m#===================================================#\033[m"
echo ""
echo -e "\033[0;36m[01]\033[m | Install SlowDNS SSH"
echo -e "\033[0;36m[02]\033[m | Install SlowDNS SSL"
echo -e "\033[0;36m[03]\033[m | Install SlowDNS DROP"
echo -e "\033[0;36m[04]\033[m | Install SlowDNS SOCKS"
echo -e "\033[0;36m[05]\033[m | lihat informasi"
echo -e "\033[0;36m[06]\033[m | Mulai SlowDNS"
echo -e "\033[0;36m[07]\033[m | Mulai ulang SlowDNS"
echo -e "\033[0;36m[08]\033[m | hentikan SlowDNS"
echo -e "\033[0;36m[09]\033[m | Hapus SlowDNS"
echo -e "\033[0;36m[10]\033[m | Perbarui/Instal Ulang"
echo -e "\033[0;36m[11]\033[m | Hapus Script"
echo -e "\033[0;36m[12]\033[m | Install"
echo -e "\033[0;36m[00]\033[m | KELUAR"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; bash /etc/Slowdns/slowdns-ssh ;;
02 | 2) clear ; bash /etc/Slowdns/slowdns-ssl ;;
03 | 3) clear ; bash /etc/Slowdns/slowdns-drop ;;
04 | 4) clear ; bash /etc/Slowdns/slowdns-socks ;;
05 | 5) clear ; bash /etc/Slowdns/slowdns-info ;;
06 | 6) clear ; bash /etc/Slowdns/startdns ;;
07 | 7) clear ; bash /etc/Slowdns/restartdns ;;
08 | 8) clear ; bash /etc/Slowdns/stopdns ;;
09 | 9) clear ; bash /etc/Slowdns/stopdns ; clear ; bash /etc/Slowdns/remove-slow ;;
10) clear ; wget https://raw.githubusercontent.com/HendraWahyut/HTCloud/main/Slowdns/update
    chmod +x update ; clear ; bash update ;;
11) clear ; bash /etc/Slowdns/remove-slow ; clear ; rm /bin/slowdns ;;
12) clear ; wget https://raw.githubusercontent.com/HendraWahyut/HTCloud/main/Slowdns/install chmod +x install ; clear ; bash install ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
