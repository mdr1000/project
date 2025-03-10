#!/bin/bash

#-------------------------------------------------------------------------------------------------------------------------------------
# Script to install OpenVPN server on Linux Ubuntu 24.04
# Developed by Damir Mullagaliev in 2025
#-------------------------------------------------------------------------------------------------------------------------------------

OPENVPN_VERSION="2.6.13"
OPENVPN_FOLDER_CONFIG="/etc/openvpn"

mkdir -p $OPENVPN_FOLDER_CONFIG

cd $OPENVPN_FOLDER_CONFIG
wget https://github.com/OpenVPN/openvpn/releases/download/v$OPENVPN_VERSION/openvpn-$OPENVPN_VERSION.tar.gz
tar xvfz openvpn-$OPENVPN_VERSION.tar.gz
cd openvpn-$OPENVPN_VERSION