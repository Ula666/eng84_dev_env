#provision.sh
#!/bin/bash

# run the update command
sudo apt-get update -y

# upgrade
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# install nodejs with required version and dependencies
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y

# install npm with pm2 -g
sudo npm install pm2 -g

sudo npm install /home/vagrant/app
sudo nodejs /home/vagrant/app/seeds/seed.js