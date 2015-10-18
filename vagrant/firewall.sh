#!/bin/bash

#source /vagrant/local/config.sh

iptables -F

iptables -P OUTPUT ACCEPT
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT

# local
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT

# established
iptables -A INPUT -i eth0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth1 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth1 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# SSH from NAT
iptables -A INPUT -i eth0 -s 10.0.2.2/32 -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -o eth0 -d 10.0.2.2/32 -p tcp --sport 22 -j ACCEPT

# FTP
iptables -A INPUT -i eth0 -p tcp --match multiport --dports 20:21 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --match multiport --dports 20000:20500 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --match multiport --dports 20:21 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --match multiport --dports 20000:20500 -j ACCEPT

iptables -P OUTPUT DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP

