#!/bin/bash

#-------------------------------------------------------------------------------------------
# Script to install OpenVPN server on Linux Ubuntu 24.04
# Developed by Damir Mullagaliev in 2025
#-------------------------------------------------------------------------------------------

apt-get update
yes Y | apt-get install openvpn
yes Y | apt-get install easy-rsa

mkdir /etc/openvpn/server

cat <<EOF> /etc/openvpn/server/server.conf
port 1194
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key  # This file should be kept secret
dh dh2048.pem
dh none
cipher AES-256-GCM
auth SHA256
topology subnet
server 10.8.0.0 255.255.255.0
ifconfig-pool-persist /var/log/openvpn/ipp.txt
push "redirect-gateway def1 bypass-dhcp"
keepalive 10 120
tls-auth ta.key 0 # This file is secret
user nobody
group nogroup
persist-key
persist-tun
status /var/log/openvpn/openvpn-status.log
verb 3
explicit-exit-notify 1
EOF

useradd -rs /bin/false openvpn
chown openvpn:openvpn /usr/sbin/openvpn
chown openvpn:openvpn /etc/openvpn

systemctl status openvpn
openvpn --version

/usr/sbin/openvpn --genkey --secret ta.key
mv ta.key /etc/openvpn/server

ip a

echo "-----------------------------------------------------------------------------------------------"
echo "-- Please watching eth, proto, port and add, when you starting iptables configuration script --"
echo "-----------------------------------------------------------------------------------------------"