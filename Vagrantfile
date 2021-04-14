Vagrant.configure("2") do |config|


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
	 app.vm.provision "shell", inline: 'set_env({ DB_HOST: "mongodb://192.168.10.150:27017/posts" })', privileged: false
	 #app.vm.provision "shell", inline: 'sudo echo "export DB_HOST=mongodb://192.168.10.101:27017/posts" >> /etc/profile.d/myvars.sh', run: "always"
 end

 config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.101" #different ip
	db.vm.synced_folder ".", "/home/vagrant/app"
	db.vm.provision "shell", path: "environment/provision_db.sh"


 end

end

