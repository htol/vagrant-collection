#!/usr/bin/env bash
# enable forwarding
sysctl net.ipv4.ip_forward=1

# set defaults
iptables -F
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# accept all on loopback
iptables -A INPUT -i lo -j ACCEPT 
iptables -A OUTPUT -o lo -j ACCEPT

# allow rules
iptables -A INPUT -p tcp --dport 22 -j ACCEPT # ssh
iptables -A INPUT -p tcp -m multiport --dports 3000,8000,8080 -j ACCEPT # web services
iptables -A FORWARD -p tcp -s 192.168.55.10 -j ACCEPT # only allowed host can connect to this port
iptables -A FORWARD -p tcp -d 192.168.55.10 -j ACCEPT # only allowed host can connect to this port


# allow originated sessions by us
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

iptables -F -t nat
iptables -t nat -A PREROUTING -p tcp -d 192.168.55.113 --dport 33389 -j DNAT --to-destination 10.0.2.2:3389
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 10.0.2.15
iptables -n -L
iptables -n -L -t nat
