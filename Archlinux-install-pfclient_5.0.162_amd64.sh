#!/bin/bash

TARBALL=pfclient_5.0.162_amd64.tar.gz
RESOURCE_FOLDER=/usr/share/pfclient
sudo mkdir ${RESOURCE_FOLDER}
echo "Downloading tarball" ${TARBALL} "from Planefinder"
sudo pacman -Sy --needed wget
sudo wget -O ${RESOURCE_FOLDER}/${TARBALL} "http://client.planefinder.net/${TARBALL}"
sudo bsdtar -xvpf ${RESOURCE_FOLDER}/${TARBALL} -C ${RESOURCE_FOLDER}

sudo cp ${RESOURCE_FOLDER}/pfclient /usr/bin/


echo "Creating config file pfclient-config.json"
CONFIG_FILE=/etc/pfclient-config.json
sudo touch ${CONFIG_FILE}
sudo chmod 777 ${CONFIG_FILE}
echo "Writing code to config file pfclient-config.json"
/bin/cat <<EOM >${CONFIG_FILE}
{}

EOM

sudo chmod 666 ${CONFIG_FILE}

echo "Creating user pf to run service"
sudo useradd --system pf

echo "Creating Service file fr24feed.service"
SERVICE_FILE=/usr/lib/systemd/system/pfclient.service
sudo touch ${SERVICE_FILE}
sudo chmod 777 ${SERVICE_FILE}
/bin/cat <<EOM >${SERVICE_FILE}
[Unit]
Description=Planefinder Feeder
After=network-online.target

[Service]
Type=simple
Restart=always
LimitCORE=infinity
RuntimeDirectory=fr24feed
RuntimeDirectoryMode=0755
ExecStartPre=-/bin/mkdir -p /var/log/pfclient
ExecStartPre=-/bin/chown pf /var/log/pfclient
ExecStart=/usr/bin/pfclient --config_path=/etc/pfclient-config.json --log_path=/var/log/pfclient $ 2>/var/log/pfclient/error.log
User=pf
PermissionsStartOnly=true
StandardOutput=null

[Install]
WantedBy=multi-user.target

EOM

sudo chmod 644 ${SERVICE_FILE}
sudo systemctl enable pfclient
sudo systemctl restart pfclient

echo " "
echo " "
echo -e "\e[32mINSTALLATION COMPLETED \e[39m"
echo -e "\e[32m=======================\e[39m"
echo -e "\e[32mPLEASE DO FOLLOWING:\e[39m"
echo -e "\e[32m=======================\e[39m"
echo -e "\e[32mSIGNUP:\e[39m"
echo -e "\e[32mIn your browser, go to web interface at\e[39m"
echo -e "\e[39m     http://$(ip route | grep -m1 -o -P 'src \K[0-9,.]*'):30053 \e[39m"
echo -e "\e[32mFill necessary details to sign up / sign in\e[39m"
echo -e "\e[32mUse IP Address 127.0.0.1 and Port number 30005 when asked for these\e[39m"
echo " "
echo " "
echo -e "\e[32mTo see status\e[39m sudo systemctl status pfclient"
echo -e "\e[32mTo restart\e[39m    sudo systemctl restart pfclient"
echo -e "\e[32mTo stop\e[39m       sudo systemctl stop pfclient"


