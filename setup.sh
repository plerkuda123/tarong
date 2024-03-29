#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
BURIQ () {
curl -sS https://raw.githubusercontent.com/jambanbkn/tarap/main/ipvps > /root/tmp
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
rm -f  /etc/.$user.ini > /dev/null 2>&1
fi
done
rm -f  /root/tmp
}
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/jambanbkn/tarap/main/ipvps | grep $MYIP | awk '{print $2}')
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
IZIN=$(curl -sS https://raw.githubusercontent.com/jambanbkn/tarap/main/ipvps | awk '{print $4}' | grep $MYIP)
if [ "$MYIP" = "$IZIN" ]; then
Bloman
else
res="Permission Denied!"
fi
BURIQ
}
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
mkdir -p /etc/xray
mkdir -p /etc/v2ray
echo -e "[ ${tyblue}NOTES${NC} ] Before we go.. "
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] I need check your headers first.."
sleep 2
echo -e "[ ${tyblue}INFO${NC} ] Checking headers"
sleep 1
secs_to_human() {
echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
coreselect=''
cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
END
chmod 644 /root/.profile
echo -e "[ ${tyblue}INFO${NC} ] Preparing the install file"
apt install git curl -y >/dev/null 2>&1
echo -e "[ ${tyblue}INFO${NC} ] Alright good ... installation file is ready"
sleep 2
echo -ne "[ ${tyblue}INFO${NC} ] Check permission : "
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
green "Permission Accepted!"
else
red "Permission Denied!"
rm setup.sh > /dev/null 2>&1
sleep 5
exit 0
fi
sleep 2
mkdir -p /etc/tarap
mkdir -p /etc/tarap/theme
mkdir -p /var/lib >/dev/null 2>&1
echo "IP=" >> /var/lib/ipvps.conf
if [ -f "/etc/xray/domain" ]; then
echo ""
echo -e "[ ${tyblue}INFO${NC} ] Script Already Installed"
echo -ne "[ ${yell}WARNING${NC} ] Do you want to install again ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
rm -f setup.sh
sleep 5
exit 0
else
clear
fi
fi
echo ""
wget -q https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/dependencies.sh;chmod +x dependencies.sh;./dependencies.sh
rm dependencies.sh
clear
echo ""
echo -e "               ${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "               ${tyblue}         Please select a domain type below                 ${NC}"
echo -e "               ${tyblue}└──────────────────────────────────────────┘${NC}"
echo -e "               ${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "               ${tyblue}        [ 1 ]  Enter your Subdomain                        ${NC}"
echo -e "               ${tyblue}        [ 2 ]  Use a random Subdomain                      ${NC}"
echo -e "               ${tyblue}└──────────────────────────────────────────┘${NC}"
read -p "   Please select numbers 1-2 or Any Button(Random) : " dns
echo ""
if [[ $dns == "1" ]]; then
echo -e  "               ${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e  "               ${tyblue}|  TERIMA KASIH SUDAH MENGGUNAKAN SCRIPT   |${NC}"
echo -e  "               ${tyblue}|        DARI SAYA BY TARAP KUHING         |${NC}"
echo -e  "               ${tyblue}|        TAMBAHKAN DOMAIN KAMU..           |${NC}"
echo -e  "               ${tyblue}|        KALAU ADA PERTANYAAN SILAHKAN     |${NC}"
echo -e  "               ${tyblue}|        CHAT DI WA OK BROOOO....          |${NC}"
echo -e  "               ${tyblue}|        https://wa.me/085754292950        |${NC}"
echo -e  "               ${tyblue}└──────────────────────────────────────────┘${NC}"
echo " "
read -rp "Masukan Domain Kamu OK Brooo : " -e dns
echo "$dns" > /root/domain
#echo "$dns" > /root/scdomain
echo "$dns" > /etc/xray/domain
echo "$dns" > /etc/v2ray/domain
#echo "$dns" > /etc/v2ray/scdomain
#echo "$dns" > /etc/xray/scdomain
echo "IP=$dns" > /var/lib/ipvps.conf
echo ""
elif [[ $dns == "2" ]]; then
wget https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/SSH/Tarap-Kuhing.sh && chmod +x Tarap-Kuhing.sh && ./Tarap-Kuhing.sh
clear
else
echo -e "Random Subdomain/Domain is used"
wget https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/SSH/Tarap-Kuhing.sh && chmod +x Tarap-Kuhing.sh && ./Tarap-Kuhing.sh
clear
fi
cat <<EOF>> /etc/tarap/theme/red
BG : \E[40;1;41m
TEXT : \033[0;31m
EOF
cat <<EOF>> /etc/tarap/theme/blue
BG : \E[40;1;44m
TEXT : \033[0;34m
EOF
cat <<EOF>> /etc/tarap/theme/green
BG : \E[40;1;42m
TEXT : \033[0;32m
EOF
cat <<EOF>> /etc/tarap/theme/yellow
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
cat <<EOF>> /etc/tarap/theme/magenta
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
cat <<EOF>> /etc/tarap/theme/cyan
BG : \E[40;1;46m
TEXT : \033[0;36m
EOF
cat <<EOF>> /etc/tarap/theme/color.conf
blue
EOF
clear
sleep 5
clear
echo -e "                 ${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "                 ${tyblue}|     PROCESS INSTALLED SSH & OPENVPN      |${NC}"
echo -e "                 ${tyblue}└──────────────────────────────────────────┘${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/SSH/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
echo -e "                 ${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "                 ${tyblue}|          PROCESS INSTALLED XRAY          |${NC}"
echo -e "                 ${tyblue}└──────────────────────────────────────────┘${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/XRAY/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
echo -e "                 ${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "                 ${tyblue}|      PROCESS INSTALLED WEBSOCKET SSH     |${NC}"
echo -e "                 ${tyblue}└──────────────────────────────────────────┘${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/WEBSOCKET/insshws.sh && chmod +x insshws.sh && ./insshws.sh
echo -e "                 ${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "                 ${tyblue}|          PROCESS INSTALLED OHP           |${NC}"
echo -e "                 ${tyblue}└──────────────────────────────────────────┘${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/Tarap-Kuhing/tarap/main/sshws/ohp.sh && chmod +x ohp.sh && ./ohp.sh
echo -e "                 ${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "                 ${tyblue}|           DOWNLOAD EXTRA MENU            |${NC}"
echo -e "                 ${tyblue}└──────────────────────────────────────────┘${NC}"
sleep 2
wget https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/update.sh && chmod +x update.sh && ./update.sh
clear
echo -e "                 ${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "                 ${tyblue}|           DOWNLOAD SLOWDNS               |${NC}"
echo -e "                 ${tyblue}└──────────────────────────────────────────┘${NC}"
sleep 2
wget https://raw.githubusercontent.com/Tarap-Kuhing/tarap/main/ssh/slowdns.sh && chmod +x slowdns.sh && ./slowdns.sh
clear
echo -e "                 ${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "                 ${tyblue}|           DOWNLOAD BACKUP MENU          |${NC}"
echo -e "                 ${tyblue}└──────────────────────────────────────────┘${NC}"
sleep 2
wget https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/SSH/set-br.sh && chmod +x set-br.sh && ./set-br.sh
clear
cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
menu
END
chmod 644 /root/.profile
if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/version  )
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
curl -sS ifconfig.me > /etc/myipvps
echo " "
echo "Installation has been completed!!"
echo " "
echo "━━━━━━━━━━━━━━━━━━━━━━━━[SCRIPT PREMIUM]━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "              [INFORMASI SSH ]" | tee -a log-install.txt
echo "    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a log-install.txt
echo "   - OpenVPN                 : 2086"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - Stunnel4                : 8443, 8880"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - SSH Websocket           : 80, 8080"  | tee -a log-install.txt
echo "   - SSH SSL Websocket       : 443, 444"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "              [INFORMASI  Bdvp, Ngnx]" | tee -a log-install.txt
echo "    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a log-install.txt
echo "   - Badvpn                  : 7100-7900"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "              [INFORMASI Shadowsocks-R & Shadowsocks]"  | tee -a log-install.txt
echo "    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a log-install.txt
echo "   - Websocket Shadowsocks   : 443"  | tee -a log-install.txt
echo "   - Shadowsocks GRPC        : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "              [INFORMASI XRAY]"  | tee -a log-install.txt
echo "    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a log-install.txt
echo "   - Xray Vmess Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Vless Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Vmess Ws None Tls  : 80,8080"  | tee -a log-install.txt
echo "   - Xray Vless Ws None Tls  : 80,8080"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "             [INFORMASI TROJAN]"  | tee -a log-install.txt
echo "    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a log-install.txt
echo "   - Websocket Trojan        : 443"  | tee -a log-install.txt
echo "   - Trojan GRPC             : 443"  | tee -a log-install.txt
echo "   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On           : $aureb:00 $gg GMT +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
echo "   - Backup & Restore Data" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "━━━━━━━━━━━━━━━━━━━━━━━━[SCRIPT PREMIUM]━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo -e "   ${tyblue}Your VPS Will Be Automatical Reboot In 15 seconds${NC}"
rm /root/setup.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
rm /root/ohp.sh >/dev/null 2>&1
rm /root/update.sh >/dev/null 2>&1
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo  ""
echo -e "                   ${tyblue}┌───────────────────────────────────────────┐${NC}"
echo -e "                   ${tyblue}|Install Script VPS By TARAP KUHING SELESAI |${NC}"
echo -e "                   ${tyblue}└───────────────────────────────────────────┘${NC}"
echo  ""
sleep 3
echo -e "                                       ${tyblue}[ R ]${NC}"
echo  ""
sleep 2
echo -e "                                       ${tyblue}[ E ]${NC}"
echo  ""
sleep 2
echo -e "                                       ${tyblue}[ B ]${NC}"
echo ""
sleep 2
echo -e "                                       ${tyblue}[ O ]${NC}"
echo ""
sleep 2
echo -e "                                       ${tyblue}[ O ]${NC}"
echo  ""
sleep 2
echo -e "                                       ${tyblue}[ T ]${NC}"
sleep 2
reboot
