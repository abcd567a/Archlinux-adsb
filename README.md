# ArchLinux-adsb


### Install ADS-B Software on Arch Linux AMD64 </br>

### The details below describe how to install following items: </br>

**1 - Decoder (dump1090-fa)** </br>
**2 - Flightradar24 Feeder (fr24feed)** </br>
**3 - Planefinder Feeder (pfclient)** </br>
**4 - Flightaware Feeder (piaware)** </br>

</br>

## (1) - Install Decoder - dump1090-fa </br>

##  https://github.com/abcd567a/archlinux-dump1090-fa/blob/master/README.md

</br>

## (2) - Install FlightRadar24 feeder </br>
### Option 1: fr24feed_1.0.44-0_amd64
```
sudo bash -c "$(wget -O - https://raw.githubusercontent.com/abcd567a/Archlinux-adsb/master/ArchLinux-install-fr24feed_amd64.sh)"
```

### Option 2: fr24feed_1.0.44-0_i386
```
sudo bash -c "$(wget -O - https://raw.githubusercontent.com/abcd567a/Archlinux-adsb/master/ArchLinux-install-fr24feed_i386.sh)"
```

### Option 3: On Alarm Pi fr24feed_1.0.44-0_armhf and fr24feed_1.0.44-0_arm64
```
sudo bash -c "$(wget -O - https://github.com/abcd567a/Archlinux-adsb/raw/master/AlarmPi-install-fr24feed.sh)"

``` 

</br>

## (3) - Install Planefinder feeder pfclient_5.0.162_amd64 :</br>

```
sudo bash -c "$(wget -O - https://raw.githubusercontent.com/abcd567a/Archlinux-adsb/master/Archlinux-install-pfclient-amd64.sh)"

``` 

</br>

## (4) - Install Flightaware feeder - piaware latest version: </br>

## https://github.com/abcd567a/archlinux-piaware/blob/master/README.md

</br></br>
