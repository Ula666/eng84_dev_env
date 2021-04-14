# eng84_dev_env

## Infrastructure revolution
- on premises 9% software licence (more ongoing costs)
- cloud 68% sybscription fee

## Application Design Patterns
- the monofith (just one thing)  
- front and back (divided into frontend and backend)  
- microservices ( frontend, aggregation layer, (product service, backet service, payment service, reco servise))  


## Software Development Methodology
- Waterfall (sequence, hard to track back, fix issues)
- Agile (iterations, easier to fix bugs)


## Chalenges in IT  
### challenges in new SDLC
- ease of use
- flexibility
- robustness (system must cope with errors, invalid or unexpected input)
- cost

## DevOps ( Developers, Testers and IT Operations)  
- A collaboration of Developers and Operations
- A cluture which promotes collaboration between Development and Operations Team to deploy code to production faster in an automated and repeatable way
- A practice of development and operation engineers taking part together in the whole service lifecycle
- An approach through which superior quality software can be developed quickly and with more reliability  


## DevOps Value (CAMS Model)
- Sharing
- Measurement
- Automation
- Culture


## DevOps Principles
- Customer - Cnetric Action
- End-to-end Responsibility
- Continous Improvement
- Automate everything

## Stages in DevOps Lifecycle
- Continuous Development
- Continuous Testing
- Continuous Integration
- Continuous Deployment
- Continuous Monitoring


## DevOps Tools: 
- Chef
- Ansible
- git
- sensu
- jenkins
- bamboo
- nagios
- puppet
- saltstack
- gradle
- maven
- eclipse

## DevOps implementation:
- cloud platform (AWS, GCP, Azure)
- infrastructure architecture ( virtualization, containerization)
- DevOps implementations (IaC, IaaS, IaaP, infrastructure as a product)





### vagrant commands:
- `vagrant up` to open Virtual Machine
- `vagrant status` checks the status of Vagrant
- `vagrant reload` to reload machine
- `vagrant halt` to close the Virtual Machine


### Linux commands:
- `apt-get` to install updates/packages
- `cat filename` to display the file content
- `mkdir directoryname` to create a new 
directory(folder)
- `rmdir directoryname` deletes the directory
- `clear` to clear the current screen
- `nano filename` to create a new file
- `cd directoryname` moves to this directory
- `cd ..` go back to previous directory 
- `cd` to go back to home
- `ls` shows files in current directory, `la -a` shows also the hidden files
- `uname` who am I
- `sudo` is used to run commands as an admin
- `sudo su` to go into admin mode
- `pwd` where am I, print current location
- `sudo apt-get update -y` update command, y says yes
- `sudo apt-get upgrade -y` update command
- `mv README.md MYREADME.md` to rename a file we have to move a file and add it a new name
- `cp MYREADME.md devops/MYREADME.md` to copy readmy files to devops folder
- `rm MYREADME.md` to remove a file

- chmod permision 700, 400, u, x(execute) , w(write), r(read)
- `chmod +x provision.sh` to give permission to a file
- `./provision.sh` to run 
- `ll` to check permissions
- `top` to check current processes running
- `ps` check process `ps aux` same but with user permissions

### install web server NGINX
- `sudo apt-get install nginx`
- `systemctl status nginx` check if the nqinx has been installed
- 

### updates to alias ip with logical web address
- `vagrant plugin uninstall vagrant-hostsupdater`
- `vagrant plugin install vagrant-hostsupdater --plugin-version=1.0.2`


### Let's automate the installation of required dependencies in our vagrant file to run our script

- add shell script path to our Vagrantfile 
- `config.vm.provision "shell", path: "environment/provision.sh"`

### To check the connection:
- `http://development.local:3000`
- `http://development.local:3000/fibonacci/4`

### Let's create our script:
```
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

```


## Added multiple VMs (db and app)
### Vagrantfile
- the app:
```
 config.vm.define "app" do |app|
	# Creating a virtual machine ubuntu 16.04
	 app.vm.box = "ubuntu/xenial64"
	# Let's attach private network with IP
	 app.vm.network "private_network", ip: "192.168.10.100"
	# Let's create an alias to link this ip with logical web address
	 app.hostsupdater.aliases = ["development.local"]
	# To transfer files/folder data from our OS to VM vagrant has an option on synced_folder
	 app.vm.synced_folder ".", "/home/vagrant/app"
	# Run the shell script from the given location
	 app.vm.provision "shell", path: "environment/provision.sh"
	 #app.vm.provision "shell", inline: 'set_env({ DB_HOST: "mongodb://192.168.10.150:27017/posts" })', privileged: false
	 app.vm.provision "shell", inline: 'sudo echo "export DB_HOST=mongodb://192.168.10.101:27017/posts" >> /etc/profile.d/myvars.sh', run: "always"
 end
```
- the database:
```
 config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.101" #different ip
	db.vm.synced_folder ".", "/home/vagrant/app"
	db.vm.provision "shell", path: "environment/provision_db.sh"
 end
```

### MONGODB:
- `sudo systemctl start mongod` to start the database
- `sudo systemctl status mongod` to check the status
- `sudo systemctl stop mongod` to stop the database

### to update the seed
- `node seeds/seed.js `




## Linux varaiables and Env var 
- `env`, `printenv` to check the enviroment
- to create enviroment example: `export DEVOPS=Engineering84`
- export is the keyword to create an env variable
- as key=value, key="sme other value"
- key = value1:value2
- What are the system default env variables? `USER`, `HOME`, `PATH`, `TERM`
- `export ENG_VAR="Engineering84"` to create env var
- `cat ~/.profile` to make var persistent

- to make variable persistent we have to save in ~/.bashrc file
- `sudo nano ~/.bashrc` 
- `export [VARIABLE_NAME]=[variable_value]`


