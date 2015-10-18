
# Read the incoming path from the local config.
#incoming_path = "./incoming/"
#for line in File.read("local/config.sh").lines()
#    parts = line.split("=")

#    if parts.length > 0 && parts[0] == "INCOMING_PATH"
#        incoming_path = parts[1..-1].join("=").tr('"', '').strip!
#        break
#    end
#end

Vagrant.configure(2) do |config|
	config.vm.box = "ubuntu/trusty64"
	config.vm.hostname = "ftp.vm.b"
    config.vm.network "public_network", :mac => 'AA7777777705'
	
    config.vm.provision :shell, path: "vagrant/configure-vm.sh"
end
