#!/bin/bash

#-------------------------------------------------------------------------------------------------------------------------------------
# Script to install OpenVPN server on Linux Ubuntu 24.04
# Developed by Damir Mullagaliev in 2025
#-------------------------------------------------------------------------------------------------------------------------------------

OPENVPN_FOLDER_CONFIG=/etc/openvpn

apt-get update
Y | apt-get install openvpn
Y | apt-get install easy-rsa

mkdir $OPENVPN_FOLDER_CONFIG/server
touch $OPENVPN_FOLDER_CONFIG/server/server.conf

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
chown openvpn:openvpn $OPENVPN_FOLDER_CONFIG


systemctl daemon-reload
systemctl start openvpn
systemctl enable openvpn
systemctl status openvpn
openvpn --version