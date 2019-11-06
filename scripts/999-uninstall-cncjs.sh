echo "prefix=~/.npm" >> ~/.npmrc
cat ~/.npmrc
npm config set user 0
npm config set unsafe-perm true


npm uninstall -g socket.io
npm uninstall -g socket.io-parser
#npm install -g serialport
npm uninstall -g cncjs
#sudo npm install --unsafe-perm -g cncjs
export PATH=$PATH:~/.npm/bin/
