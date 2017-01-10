#!/bin/bash

# Run as sudo
# Notes:
#   - Installs PPAs

export DEBIAN_FRONTEND='noninteractive'

apt-add-repository -y ppa:fish-shell/release-2 
apt-add-repository -y ppa:neovim-ppa/unstable
apt-get -y update 

