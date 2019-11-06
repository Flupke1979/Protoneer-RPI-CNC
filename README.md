# RPI-CNC-Config-Scripts
Scripts used to setup a Raspberry Pi for use with the Raspberry Pi CNC board

* Get latest rpi image and copy to SD card (https://www.raspberrypi.org/downloads/raspbian/)
* edit "sudo nano /boot/cmdline.txt" remove "Console" settings. (Stops the logging of system messages to the serial port)
* SSH to  RPI, Expand FS first with "sudo raspi-config"

```
cd ~
git clone https://github.com//Flupke1979/Protoneer-RPI-CNC.git
cd Protoneer-RPI-CNC/
sudo ./setup
```
