Vagrant.configure("2") do |config|


 config.vm.box = "ubuntu/xenial64"
# creating a virtual machine ubuntu 16.04

#Let's attach private network with IP

config.vm.network "private_network", ip: "192.168.10.100"
# let's create an alias to link this ip with logical web address
config.hostsupdater.aliases = ["development.local"]
end