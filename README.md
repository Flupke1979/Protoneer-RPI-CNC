# RPI-CNC-Config-Scripts
Scripts used to setup a Raspberry Pi for use with the Raspberry Pi CNC board

* Get latest rpi image and copy to SD card with Balena etcher (https://www.raspberrypi.org/downloads/raspbian/)

	If lite install git after startup  https://www.atlassian.com/git/tutorials/install-git#linux

* Get latsest GRBL Firmware for Atmega 328 (If using RPI shield Protoneer) and place in Protoneer-RPI-CNC/Resources/Firmware on Github as grbl_latest.hex

* Add SSH and WPA supplicant file to boot on SD-card

* Boot Pi and find Ip Adress

* SSH to  RPI
 
* edit "sudo nano /boot/cmdline.txt" remove "Console" settings. (Stops the logging of system messages to the serial port)

* sudo raspi-config
	* Expand FS
	* Change Timezone
	* Change Wifi Country  (If not doen with WPA 
	* Change Hostname
	* Change Boot Option: Boot to CLI (No GUI)
	* Change Wifi Settings
	* Reboot

* SSH to  RPI

```

#Get files from Github
	cd ~
	git clone https://github.com//Flupke1979/Protoneer-RPI-CNC

#Update OS and clean
	cd Protoneer-RPI-CNC/scripts/
	bash ./000-UpdateClean.sh
#reboots

#SSH to Pi
#Install NodeJs
	cd Protoneer-RPI-CNC/scripts/
	bash ./001-install-node.sh
#reboots

#SSH to Pi
#Update nmp
	npm i npm@latest -g
	sudo reboot
#reboots

#SSH to Pi
	cd Protoneer-RPI-CNC/scripts/
#Install cncjs
	bash ./002-install-cncjs.sh
#Clean
	bash ./003-freeSpace.sh
#Set RPI3 serial settings
	bash ./004-RPi3-Serial-Config.sh
#reboots

#SSH to Pi
#Create watch folder
	mkdir watch

#Install SAMBA
	sudo apt-get install samba samba-common-bin
	sudo nano /etc/samba/smb.conf
	#add to file
		[watch]
		comment = Watch folder for G-Codes
		path = /home/pi/watch
		writeable = Yes
		only guest = No
		create mask = 0777
		directory mask = 0777
		browseable = Yes
		public = yes
	#Save file
	sudo service smbd restart
	sudo smbpasswd -a pi
	sudo reboot
#reboots

#SSH to Pi	
#Create cncjs config file
	sudo nano ~/.cncrc
	#Add content from .cncrc file

#Add Shopfloor Tablet
	git clone https://github.com/cncjs/cncjs-shopfloor-tablet

#Autostart cncjs	
	cd Protoneer-RPI-CNC/scripts/
	bash ./005-Autostart-cncjs.sh     shopfloor nog integreren in start commando

#Change Firewall rules
	bash ./006-Iptables.sh
	sudo reboot
#reboots

#SSH to Pi
#Only when flashing Shield is necessary
	cd Protoneer-RPI-CNC/scripts/
	bash ./007-install-Arduino.sh
	bash ./003-freeSpace.sh
	
#Change AVRDude files	
	In AVRDude change avrdude-autoreset file to current Arduino version (With WinSCP)

#Flash Shield
	cd Protoneer-RPI-CNC/resources/scripts
	bash ./Run-Flash-GRBL-Latest.sh


#Power Off-On

#Through cncjs load GRBL settings

```
