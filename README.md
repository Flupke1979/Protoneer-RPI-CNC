# RPI-CNC-Config-Scripts
Scripts used to setup a Raspberry Pi for use with the Raspberry Pi CNC board

* Get latest rpi image and copy to SD card with Balenaetcher(https://www.raspberrypi.org/downloads/raspbian/)

* edit "sudo nano /boot/cmdline.txt" remove "Console" settings. (Stops the logging of system messages to the serial port)

* SSH to  RPI,  "sudo raspi-config":
	* Expand FS first with
	* Change Timezone
	* Change Hostname
	* Change Boot Option: Boot to CLI (No GUI)
	* Reboot

* SSH to  RPI

```
cd ~
git clone https://github.com//Flupke1979/Protoneer-RPI-CNC.git

cd Protoneer-RPI-CNC/scripts/
./000-UpdateClean.sh

cd Protoneer-RPI-CNC/scripts/
./001-GeneralSetup.sh

cd Protoneer-RPI-CNC/scripts/
./002-install-node.sh

cd Protoneer-RPI-CNC/scripts/
./003-install-Arduino.sh
./004-install-cncjs.sh
./005-freeSpace.sh
./006-RPi3-Serial-Config.sh



#To test
#cd Protoneer-RPI-CNC/scripts/
#./007-Autostart-cncjs.sh
#./008-Iptables.sh

sudo reboot

cd Protoneer-RPI-CNC/scripts/
./009-Flash-GRBL-V1.1H.sh


#sudo ./setup
```
