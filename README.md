# RPI-CNC-Config-Scripts
Scripts used to setup a Raspberry Pi for use with the Raspberry Pi CNC board

* Get latest rpi image and copy to SD card with Balena etcher (https://www.raspberrypi.org/downloads/raspbian/)

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
	#If git is not installed (Lite version Raspbian):
		sudo apt-get update
		sudo apt-get install git

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
#Update npm
	sudo npm i npm@latest -g
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
#Add Shopfloor Tablet
	git clone https://github.com/cncjs/cncjs-shopfloor-tablet

#Autostart cncjs	
	sudo npm install -g pm2
	pm2 startup  # To start PM2 as pi / current user
    #Copy the command as shown in the terminal and execute
	pm2 start $(which cncjs) -- -m /tablet:/home/pi/cncjs-shopfloor-tablet/src
	pm2 save
	pm2 list

#Create cncjs config file
	sudo nano ~/.cncrc
	#Add content from .cncrc file but use the newly created secret

#Change Firewall rules
	cd Protoneer-RPI-CNC/scripts/
	bash ./006-Iptables.sh
	sudo reboot
#reboots

#SSH to Pi
#Only when flashing Shield is necessary
	cd Protoneer-RPI-CNC/scripts/
	bash ./007-install-Arduino.sh
	bash ./003-freeSpace.sh

#Flash Shield
	cd ~
	cd Protoneer-RPI-CNC/resources/scripts
	bash ./Run-Flash-GRBL-Latest.sh


#Power Off-On

#Through cncjs load GRBL settings

```
