#!/bin/sh

# Disable SELinux
sudo setenforce 0
sudo sed -i '/^SELINUX=.*/s//SELINUX=disabled/' /etc/selinux/config

# Set up hosts file
sudo sed -i 1d /etc/hosts 
printf '192.168.56.200 cloudera-stream-processing\n' | sudo tee -a /etc/hosts > /dev/null

# Upgrading Oracle Linux box with latest packages
sudo yum -y update

# Installing docker and docker compose packages 
sudo yum -y install docker docker-compose git

# Enable Docker service
sudo systemctl enable --now docker

# Add public key to authorized keys for vagrant user
cat /vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

