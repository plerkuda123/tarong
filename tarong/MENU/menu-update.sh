#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/jambanbkn/tarap/main/ipvps | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";

    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/jambanbkn/tarap/main/ipvps | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";

exit 0
fi
clear
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
clear
echo -e "\E[44;1;39m ⇱ [INFO] Remove File Script ⇲        \E[0m"
sleep 2
rm -rf menu
rm -rf menu-ss
rm -rf menu-vmess
rm -rf menu-vless
rm -rf menu-trojan
rm -rf menu-ssh
rm -rf menu-set
rm -rf menu-theme
rm -rf menu-backup
rm -rf menu-ip
rm -rf menu-tor
rm -rf menu-tcp
rm -rf autoboot
rm -rf menu-tcp
rm -rf rebootvps
rm -rf menu-dns
rm -rf info
rm -rf mspeed
rm -rf mbandwith
rm -rf restart
rm -rf menu-update
rm -rf update
rm -rf restore2
rm -rf backup2
rm -rf autobackup
rm -rf crt
rm -rf file
echo -e "\E[44;1;39m ⇱ [INFO] Downloading New File Script ⇲        \E[0m"
cd /usr/bin
rm -rf menu
rm -rf menu-ss
rm -rf menu-vmess
rm -rf menu-vless
rm -rf menu-trojan
rm -rf menu-ssh
rm -rf menu-set
rm -rf menu-theme
rm -rf menu-backup
rm -rf menu-ip
rm -rf menu-tor
rm -rf menu-tcp
rm -rf autoboot
rm -rf menu-tcp
rm -rf rebootvps
rm -rf menu-dns
rm -rf info
rm -rf mspeed
rm -rf mbandwith
rm -rf restart
rm -rf menu-update
rm -rf update
rm -rf restore2
rm -rf backup2
rm -rf autobackup
rm -rf crt
rm -rf file

wget -O /usr/bin/menu "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu.sh" && chmod +x /usr/bin/menu
wget -O /usr/bin/menu-ss "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-ss.sh" && chmod +x /usr/bin/menu-ss
wget -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-vmess.sh" && chmod +x /usr/bin/menu-vmess
wget -O /usr/bin/menu-vless "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-vless.sh" && chmod +x /usr/bin/menu-vless
wget -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-trojan.sh" && chmod +x /usr/bin/menu-trojan
wget -O /usr/bin/autobackup "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/autobackup.sh" && chmod +x /usr/bin/autobackup
wget -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-ssh.sh" && chmod +x /usr/bin/menu-ssh
wget -O /usr/bin/menu-set "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-set.sh" && chmod +x /usr/bin/menu-set
wget -O /usr/bin/menu-theme "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-theme.sh" && chmod +x /usr/bin/menu-theme
wget -O /usr/bin/menu-backup "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-backup.sh" && chmod +x /usr/bin/menu-backup
wget -O /usr/bin/menu-ip "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-ip.sh" && chmod +x /usr/bin/menu-ip
wget -O /usr/bin/menu-tor "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-tor.sh" && chmod +x /usr/bin/menu-tor
wget -O /usr/bin/autoboot "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/autoboot.sh" && chmod +x /usr/bin/autoboot
wget -O /usr/bin/menu-tcp "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-tcp.sh" && chmod +x /usr/bin/menu-tcp
wget -O /usr/bin/rebootvps "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/rebootvps.sh" && chmod +x /usr/bin/rebootvps
wget -O /usr/bin/menu-dns "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-dns.sh" && chmod +x /usr/bin/menu-dns
wget -O /usr/bin/info "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/info.sh" && chmod +x /usr/bin/info
wget -O /usr/bin/mspeed "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-speedtest.sh" && chmod +x /usr/bin/mspeed
wget -O /usr/bin/mbandwith "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-bandwith.sh" && chmod +x /usr/bin/mbandwith
wget -O /usr/bin/restart "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/restart.sh" && chmod +x /usr/bin/restart
wget -O /usr/bin/menu-update "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/menu-update.sh" && chmod +x /usr/bin/menu-update
wget -O /usr/bin/update "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/update.sh" && chmod +x /usr/bin/update
wget -O /usr/bin/crt "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/XRAY/crt.sh" && chmod +x /usr/bin/crt
#wget -O /usr/bin/slowdns "https://raw.githubusercontent.com/Tarap-Kuhing/Slowdns/main/slowdns" && chmod +x /usr/bin/slowdns
wget -O /usr/bin/file "https://raw.githubusercontent.com/Tarap-Kuhing/tarap/main/ssh/file.sh" && chmod +x /usr/bin/file
wget -O /usr/bin/backup2 "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/SSH/backup2.sh" && chmod +x /usr/bin/backup2
wget -O /usr/bin/restore2 "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/SSH/restore2.sh" && chmod +x /usr/bin/restore2
wget -O /usr/bin/autobackup "https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/SSH/autobackup.sh" && chmod +x /usr/bin/autobackup


chmod +x menu
chmod +x menu-ss
chmod +x menu-vmess
chmod +x menu-vless
chmod +x menu-trojan
chmod +x autobackup
chmod +x menu-ssh
chmod +x menu-set
chmod +x menu-theme
chmod +x menu-backup
chmod +x menu-ip
chmod +x menu-tor
chmod +x menu-tcp
chmod +x autoboot
chmod +x menu-tcp
chmod +x rebootvps
chmod +x menu-dns
chmod +x info
chmod +x mspeed
chmod +x mbandwith
chmod +x restart
chmod +x menu-update
chmod +x update
chmod +x crt
chmod +x file
chmod +x backup2
chmod +x restore2
chmod +x autobackup
echo -e "\E[44;1;39m ⇱ [INFO] Downloading New File Script Succes ⇲        \E[0m"
sleep 1
cd
