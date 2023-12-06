#!/bin/bash
set -e
trap 'echo "[ERROR] Error in line $LINENO when executing: $BASH_COMMAND"' ERR

VERSION="1.0.44-0"
RESOURCE_FOLDER=/usr/share/fr24feed
sudo mkdir ${RESOURCE_FOLDER}
echo -e "\e[1;32mDownloading Tarball fr24feed_"${VERSION}"_amd64.tgz for amd64 from Flightradar24 \e[0;39m"
sudo pacman -S --needed wget
sudo wget -O ${RESOURCE_FOLDER}/fr24feed_${VERSION}_amd64.tgz "https://repo-feed.flightradar24.com/linux_binaries/fr24feed_${VERSION}_amd64.tgz"
sudo bsdtar -xvpf ${RESOURCE_FOLDER}/fr24feed_${VERSION}_amd64.tgz -C ${RESOURCE_FOLDER}
sudo cp ${RESOURCE_FOLDER}/fr24feed_amd64/fr24feed /usr/bin/

sudo wget -O ${RESOURCE_FOLDER}/init-functions https://raw.githubusercontent.com/abcd567a/Archlinux-adsb/master/status/lsb/init-functions
sudo mkdir -p /lib/lsb
sudo cp ${RESOURCE_FOLDER}/init-functions /lib/lsb/

sudo wget -O ${RESOURCE_FOLDER}/fr24feed-status https://raw.githubusercontent.com/abcd567a/Archlinux-adsb/master/status/fr24feed-status
sudo chmod +x ${RESOURCE_FOLDER}/fr24feed-status
sudo cp ${RESOURCE_FOLDER}/fr24feed-status /usr/bin/


echo -e "\e[1;32mCreating config file fr24feed.ini \e[0;39m"
CONFIG_FILE=/etc/fr24feed.ini
sudo touch ${CONFIG_FILE}
sudo chmod 777 ${CONFIG_FILE}
echo -e "\e[1;32mWriting code to config file fr24feed.ini \e[0;39m"
/bin/cat <<EOM >${CONFIG_FILE}
receiver="avr-tcp"
host="127.0.0.1:30002"
fr24key=""

bs="no"
raw="no"
logmode="1"
logpath="/var/log/fr24feed"
mlat="yes"
mlat-without-gps="yes"

EOM

sudo chmod 666 ${CONFIG_FILE}

if [[ ! `id -u fr24` ]]; then
echo -e "\e[1;32mCreating user fr24 to run fr24feed \e[0;39m"
useradd --system fr24
else
echo -e "\e[1;32mUser fr24 already exists. Not creating it again \e[0;39m"
fi

echo -e "\e[1;32mCreating Service file fr24feed.service \e[0;39m"
SERVICE_FILE=/usr/lib/systemd/system/fr24feed.service
sudo touch ${SERVICE_FILE}
sudo chmod 777 ${SERVICE_FILE}
/bin/cat <<EOM >${SERVICE_FILE}
[Unit]
Description=Flightradar24 Feeder
After=network-online.target

[Service]
Type=simple
Restart=always
LimitCORE=infinity
RuntimeDirectory=fr24feed
RuntimeDirectoryMode=0755
ExecStartPre=-/bin/mkdir -p /var/log/fr24feed
ExecStartPre=-/bin/chown fr24 /var/log/fr24feed
ExecStart=/usr/bin/fr24feed
User=fr24
PermissionsStartOnly=true
StandardOutput=null

[Install]
WantedBy=multi-user.target

EOM

sudo chmod 644 ${SERVICE_FILE}
sudo systemctl enable fr24feed

sleep 5
sudo fr24feed --signup
echo -e "\e[1;32mRestarting fr24feed \e[0;39m"
sleep 3
sudo systemctl restart fr24feed
echo " "
echo -e "\e[1;32mINSTALLATION COMPLETED \e[0;39m"
echo -e "\e[1;32m=======================\e[0;39m"
echo -e "\e[1;32mPLEASE DO FOLLOWING:\e[0;39m"
echo -e "\e[1;32m=======================\e[0;39m"
echo " "
echo -e "\e[1;32m(2) In your browser, go to web interface at\e[0;39m"
echo -e "\e[1;39m     http://$(ip route | grep -m1 -o -P 'src \K[0-9,.]*'):8754 \e[0;39m"
echo " "
echo " "
echo -e "\e[1;32mTo see status\e[39m sudo systemctl status fr24feed"
echo -e "\e[1;32mTo restart\e[39m    sudo systemctl restart fr24feed"
echo -e "\e[1;32mTo stop \e[39m      sudo systemctl stop fr24feed"

echo -e "\e[0;39m "
