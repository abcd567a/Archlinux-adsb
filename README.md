# ArchLinux-adsb
</br>

## STEP 1 of 3: Install dump1090-fa </br>

```
sudo pacman -S --needed git

git clone https://github.com/abcd567a/dump1090-fa-arch.git  

cd dump1090-fa-arch  

makepkg -si
```
</br></br>

## STEP 2 of 3: Install FlightRadar24 feeder </br>

```
## Option 1: fr24feed_1.0.24-5_i386
sudo pacman -S --needed wget
sudo bash -c "$(wget -O - https://raw.githubusercontent.com/abcd567a/Archlinux-adsb/master/ArchLinux-install-fr24feed_1.0.24-5_i386.sh)"

## Option 2: fr24feed_1.0.18-5_amd64
sudo pacman -S --needed wget
sudo bash -c "$(wget -O - https://raw.githubusercontent.com/abcd567a/Archlinux-adsb/master/ArchLinux-install-fr24feed_1.0.18-5_amd64.sh)"
``` 

</br></br>

## STEP 3 of 3: Install Planefinder feeder on Arch Linux:</br>

```
sudo bash -c "$(wget -O - https://raw.githubusercontent.com/abcd567a/Archlinux-adsb/master/Archlinux-install-pfclient_4.1.1_i386.sh)"
``` 



