#!/bin/bash

#-------------------------------------------------------------------------------------------------------------------------------------
# Script to install OpenVPN server on Linux Ubuntu 24.04
# Developed by Damir Mullagaliev in 2025
#-------------------------------------------------------------------------------------------------------------------------------------

OPENVPN_VERSION="2.6.13"
OPENVPN_FOLDER_CONFIG="/etc/prometheus"
OPENVPN_FOLDER_TSDATA="/etc/prometheus/data"

cd /tmp
wget https://github.com/OpenVPN/openvpn/releases/download/v$OPENVPN_VERSION/openvpn-$OPENVPN_VERSION.tar.gz
tar xvfz openvpn-$PROMETHEUS_VERSION.tar.gz
cd openvpn-$PROMETHEUS_VERSION

mv openvpn-$PROMETHEUS_VERSION /etc/openvpn
rm -rf /tmp/openvpn*