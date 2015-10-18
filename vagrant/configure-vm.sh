#!/bin/bash

# Load local config.
#source /vagrant/local/config.sh

# Install needed software.
apt-get update
apt-get -y install squid-deb-proxy-client
apt-get -y install vsftpd

# Bring up the firewall.
apt-get -yd install iptables-persistent

/vagrant/vagrant/firewall.sh

echo "iptables-persistent iptables-persistent/autosave_v4 boolean true" | debconf-set-selections
echo "iptables-persistent iptables-persistent/autosave_v6 boolean true" | debconf-set-selections
apt-get -y install iptables-persistent

# Configure vsftpd
mkdir -p /var/ftp/upload
chown -hR ftp:ftp /var/ftp
cp /vagrant/local/vsftpd.conf /etc/vsftpd.conf
service vsftpd restart
chmod -w /var/ftp
