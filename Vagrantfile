# -*- mode: ruby -*-
# vi: set ft=ruby :

unless File.exists?("id_rsa")
 system("ssh-keygen -t rsa -f id_rsa -N '' -q")
end 

Vagrant.configure("2") do |config|
  config.vm.base_mac = nil
  config.vm.box = "oraclelinux/7"
  config.vm.box_url = "https://oracle.github.io/vagrant-projects/boxes/oraclelinux/7.json"

  config.vm.define "cloudera-stream-processing" do |dockerbox|
    dockerbox.vm.provider "virtualbox" do |vb|
      vb.memory = 6 * 1024
      vb.cpus = 4
      vb.name = "cloudera-stream-processing"
    end
    
    dockerbox.vm.hostname = "cloudera-stream-processing"
    dockerbox.vm.network "private_network", ip: "192.168.56.200"
    dockerbox.vm.provision :shell, privileged: false, path: "bootstrap.sh"
  end
end
