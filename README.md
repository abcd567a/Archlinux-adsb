# ArchLinux-adsb
</br>

## STEP 1 of 3: Install dump1090-fa </br>

```
sudo pacman -S --needed git

git clone https://github.com/abcd567a/dump1090-fa-arch.git  

cd dump1090-fa-arch  

makepkg -si
```

</br>
The command `makepkg -si ` will run the PKGBUILD script which will: </br>

1. Check for conflicts with existing other versions of dump1090 </br>
2. Check Build tools needed (git, make, gcc, pkgconf, binutils, and fakeroot), and will offer to install missing tools [Yes/no]. </br> 
3. Offer to install dependencies rtl-sdr, lighttpd, and bladerf [Yes/no] </br>
4. Build package `dump1090-fa-*.pkg.tar.xz` </br>
5. Offer to install the above package [Yes/no] </br>

The above package can be install later also by following command: </br>
```
cd dump1090-fa-arch 
sudo pacman -U dump1090-fa-*.pkg.tar.xz
```

**THINGS TO DO AFTER INSTALLATION OF DUMP1090-FA IS COMPLETED**
  
**(1) IMPORTANT: REBOOT COMPUTER** </br>
otherwise dump1090-fa will fail to start </br>
and a rotating wheel will appear on map, or map will not show

</br>

**(2) To make SkyView Map show range rings, do following:**

1. Open file "dump1090-fa" for editing
    sudo nano  /etc/default/dump1090-fa

2. In the opened file, go to following line:
    RECEIVER_OPTIONS="--device-index 0 --gain -10 --ppm 0 --net-bo-port 30005"
    In above line, add your latitude and longitude, so the line becomes like below:
    RECEIVER_OPTIONS="--device-index 0 --gain -10 --lat xx.xxxx --lon yy.yyyy --ppm 0 --net-bo-port 30005"
    NOTE: Repalce xx.xxxx and yy.yyyy by your actual latitude and Longitude

3. Restart dump1090-fa

    `sudo systemctl restart dump1090-fa `

4. Clear browser cache and reload browser
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



