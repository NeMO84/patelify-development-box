#!/bin/bash

# Run as sudo
# Notes:
#   - Installs to /usr/bin/fish
#   - Installs to /usr/bin/omf
#   - ~/.config/fish/
#   - ~/.config/omf/
#   - ~/.local/share/omf/

export DEBIAN_FRONTEND='noninteractive'

apt-get -y install fish
chsh -s /usr/bin/fish root
curl -L http://get.oh-my.fish > /tmp/install-omf && chmod +x /tmp/install-omf
/tmp/install-omf --noninteractive
/usr/bin/fish -c "omf install rvm"
/usr/bin/fish -c "omf install cbjohnson"
