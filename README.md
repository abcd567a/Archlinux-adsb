# ArchLinux-adsb


### Install ADS-B Software on Arch Linux AMD64 </br>

### The details below describe how to install following items: </br>

**1 - Decoder (dump1090-fa)** </br>
**2 - Flightradar24 Feeder (fr24feed)** </br>
**3 - Planefinder Feeder (pfclient)** </br>
**4 - Flightaware Feeder (piaware)** </br>

</br>

## (1) - Install Decoder - dump1090-fa </br>

##  https://github.com/abcd567a/dump1090-fa-arch/blob/master/README.md

</br>

## (2) - Install FlightRadar24 feeder </br>

```
## Option 1: fr24feed_1.0.25-3_amd64
sudo pacman -Sy --needed wget
sudo bash -c "$(wget -O - https://raw.githubusercontent.com/abcd567a/Archlinux-adsb/master/ArchLinux-install-fr24feed_amd64.sh)"


## Option 2: fr24feed_1.0.25-3_i386
sudo pacman -Sy --needed wget
sudo bash -c "$(wget -O - https://raw.githubusercontent.com/abcd567a/Archlinux-adsb/master/ArchLinux-install-fr24feed_i386.sh)"
``` 

</br>

## (3) - Install Planefinder feeder:</br>

```
sudo pacman -Sy --needed wget
sudo bash -c "$(wget -O - https://raw.githubusercontent.com/abcd567a/Archlinux-adsb/master/Archlinux-install-pfclient-amd64.sh)"
``` 

</br>

## (4) - Install Flightaware feeder - piaware: </br>

## https://github.com/abcd567a/piaware-arch/blob/main/README.md

</br></br>
