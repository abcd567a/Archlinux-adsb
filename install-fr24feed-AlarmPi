#!/bin/bash

set -e
trap 'echo "[ERROR] Error in line $LINENO when executing: $BASH_COMMAND"' ERR


echo  -e "\e[32mEnter the current version of fr24feed (For example 1.0.44-0 ) \e[39m"
read VERSION 
echo ""
echo  -e "\e[32mEnter the Architecture ( armhf OR arm64 ) \e[39m"
read ARCH
echo ""
BUILD_DIR=/usr/share/fr24-builder
mkdir ${BUILD_DIR}
wget -O ${BUILD_DIR}/fr24feed_${VERSION}_${ARCH}.deb http://repo-feed.flightradar24.com/rpi_binaries/fr24feed_${VERSION}_${ARCH}.deb 

EXT_DIR=${BUILD_DIR}/extracted
mkdir ${EXT_DIR}
bsdtar -xvpf fr24feed_${VERSION}_${ARCH}.deb -C ${BUILD_DIR}/extracted

PKG_DIR=${BUILD_DIR}/pkg
mkdir ${PKG_DIR}
bsdtar -xvpf ${EXT_DIR}/data.tar.gz -C ${PKG_DIR}

install -Dm755  ${PKG_DIR}/usr/bin/fr24feed  /usr/bin/fr24feed
install -Dm755  ${PKG_DIR}/usr/bin/fr24feed-status  /usr/bin/fr24feed-status
install -Dm644  ${PKG_DIR}/etc/systemd/system/fr24feed.service  /lib/systemd/system/fr24feed.service
sed -i '/install_dump1090.sh/d' /lib/systemd/system/fr24feed.service
install -Dm755  ${PKG_DIR}/usr/lib/fr24/create_missing_directories.sh /usr/lib/fr24/create_missing_directories.sh  
install -Dm755  ${PKG_DIR}/usr/lib/fr24/unregister_kernel_modules.sh /usr/lib/fr24/unregister_kernel_modules.sh


if [[ ! `id -u fr24` ]]; then
echo "Creating user fr24 to run fr24feed"
useradd --system fr24
else
echo "User fr24 already exists. Not creating it again"
fi

systemctl enable fr24feed

echo ""
echo "INSTALL:ATION COMPLETED"
echo "PLEASE COMPLETE SIGNUP"
echo ""
fr24feed --signup

echo ""

