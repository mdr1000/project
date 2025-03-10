#!/bin/bash

#-------------------------------------------------------------------------------------------------------------------------------------
# Script to install OpenVPN server on Linux Ubuntu 24.04
# Developed by Damir Mullagaliev in 2025
#-------------------------------------------------------------------------------------------------------------------------------------

OPENVPN_VERSION="2.6.13"

wget https://github.com/OpenVPN/openvpn/releases/download/v$OPENVPN_VERSION/openvpn-$OPENVPN_VERSION.tar.gz
tar xvfz openvpn-$OPENVPN_VERSION.tar.gz
 
rm -rf openvpn-$OPENVPN_VERSION.tar.gz
