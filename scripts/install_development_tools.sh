#!/bin/bash

# Run as sudo
# Notes:
#   - Installs necessary tools, apps, and packages

export DEBIAN_FRONTEND='noninteractive'

apt-get install -y build-essential \
				   libssl-dev \
				   neovim \
				   tmux \
				   libmysqlclient-dev \
				   libcurl4-openssl-dev \
				   nodejs

# Install golang
wget -q https://storage.googleapis.com/golang/go1.10.2.linux-amd64.tar.gz -O /tmp/go.tar.gz
mkdir -p /etc/go/1.10.2 /go/{pkg,src,bin}
tar -C /etc/go/1.10.2 -xzf /tmp/go.tar.gz
echo 'export GOROOT=/etc/go/1.10.2/go' >> ~/.bashrc
echo 'export GOPATH=/go' >> ~/.bashrc
echo 'export PATH="$PATH:/go/bin"' >> ~/.bashrc
echo 'set -gx GOROOT /etc/go/1.10.2/go' >> ~/.config/fish/conf.d/go.fish
echo 'set -gx GOPATH /go' >> ~/.config/fish/conf.d/go.fish
echo 'set -gx PATH "$GOPATH/bin" $PATH' >> ~/.config/fish/conf.d/go.fish
ln -s /etc/go/1.10.2/go/bin/go /usr/local/bin/go

# Install nvm/node
# TODO

# Install FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
git -C ~/.fzf fetch --tags
git -C ~/.fzf checkout -b 0.15.9
~/.fzf/install

# Install rvm/ruby
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.1
usermod -a -G rvm root
source /etc/profile.d/rvm.sh
rvm use 2.3.1 --default
rvm gemset use global
gem install rubygems-update --no-ri --no-rdoc
gem update --system --no-ri --no-rdoc
gem install bundler pry --no-ri --no-rdoc
echo "source /etc/profile.d/rvm.sh" >> ~/.bashrc