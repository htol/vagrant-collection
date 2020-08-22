#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get install -y --no-install-recommends zsh apt-transport-https ca-certificates curl gnupg-agent software-properties-common

#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#apt-key fingerprint 0EBFCD88
# "apt-key add" is depricated
# check https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851774 for info
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/trusted.gpg.d/docker.asc
add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get -y --no-install-recommends install docker-ce

sudo curl -sL "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

usermod -aG docker vagrant
usermod -aG docker $USERNAME
