# Remove extras
sudo apt-get -y remove --purge libreoffice-*
sudo apt-get -y remove --purge wolfram-engine

# Update
sudo apt-get -y update
sudo apt-get -y upgrade 
#sudo apt-get -y dist-upgrade


# Clean out cache
sudo apt-get clean

sudo shutdown -r now
