# RPI-CNC-Config-Scripts
Scripts used to setup a Raspberry Pi for use with the Raspberry Pi CNC board

* Get latest rpi image and copy to SD card with Balena etcher (https://www.raspberrypi.org/downloads/raspbian/)

* edit "sudo nano /boot/cmdline.txt" remove "Console" settings. (Stops the logging of system messages to the serial port)

* SSH to  RPI,  "sudo raspi-config":
	* Expand FS first with
	* Change Timezone
	* Change Wifi Country
	* Change Hostname
	* Change Boot Option: Boot to CLI (No GUI)
	* Change Wifi Settings
	* Reboot

* SSH to  RPI

```
cd ~
git clone https://github.com//Flupke1979/Protoneer-RPI-CNC

cd Protoneer-RPI-CNC/scripts/
bash ./000-UpdateClean.sh

#reboots
#SSH to Pi

cd Protoneer-RPI-CNC/scripts/
bash ./001-GeneralSetup.sh

#reboots
#SSH to Pi

cd Protoneer-RPI-CNC/scripts/
bash ./002-install-node.sh

Proberen: npm i npm@latest -g

#reboots
#SSH to Pi

cd Protoneer-RPI-CNC/scripts/
#Arduino enkel voor flashen
bash ./003-install-Arduino.sh
#AVRDude files aanpassen autoreset in Arduino map/...
bash ./004-install-cncjs.sh
bash ./005-freeSpace.sh
bash ./006-RPi3-Serial-Config.sh

SAMBA installeren
.cncr config file maken


#reboots
#SSH to Pi

#To test
#cd Protoneer-RPI-CNC/scripts/
#bash ./007-Autostart-cncjs.sh
#bash ./008-Iptables.sh

sudo reboot

#reboots
#SSH to Pi

Flash starten vanuit resources/scripts map
#cd Protoneer-RPI-CNC/scripts/
#bash ./009-Flash-GRBL-V1.1H.sh

Power Off-On

#sudo ./setup
```
