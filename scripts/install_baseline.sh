#!/bin/bash

# Run as sudo
# Notes:
#   - Installs necessary tools, apps, and packages

export DEBIAN_FRONTEND='noninteractive'

apt-get -y update
apt-get install -y apt-utils 
apt-get install -y software-properties-common net-tools curl wget git htop python-software-properties python-dev python-pip python3-dev python3-pip
apt-get -y upgrade

