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

 end

 config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.101" #different ip
    db.hostsupdater.aliases = ["development.local"]
	db.vm.synced_folder ".", "/home/vagrant/app"
	db.vm.provision "shell", path: "environment/provision.sh"
	#db.vm.network "forwarded_port", guest: 27017, host: 27017

 end

end



 #27017