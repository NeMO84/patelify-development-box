#!/bin/bash

# Run as sudo
# Notes:
#   - Installs necessary tools, apps, and packages

export DEBIAN_FRONTEND='noninteractive'

apt-get install -y build-essential libssl-dev neovim tmux libmysqlclient-dev libcurl4-openssl-dev 

# Install rvm/ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.1
usermod -a -G rvm root
source /etc/profile.d/rvm.sh
rvm use 2.3.1 --default
rvm gemset use global
gem install rubygems-update --no-ri --no-rdoc
gem update --system --no-ri --no-rdoc
gem install bundler pry --no-ri --no-rdoc
echo "source /etc/profile.d/rvm.sh" >> ~/.bashrc

# Install nvm/node
# TODO

# Install FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
git -C ~/.fzf fetch --tags
git -C ~/.fzf checkout -b 0.15.9
~/.fzf/install



