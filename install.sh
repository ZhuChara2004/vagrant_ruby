#!/usr/bin/env bash

echo '---===   UPDATING BEGIN   ===---'
sudo apt-get update && sudo apt-get upgrade
echo '---===   UPDATING  END    ===---'

echo '---=== CURL INSTALLATION BEGIN ===---'
sudo apt-get install curl libcurl4-openssl-dev nodejs
echo '---=== CURL INSTALLATION  END  ===---'

echo '---=== RVM INSTALLATION BEGIN  ===---'
su -l ubuntu -c 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3'
su -l ubuntu -c 'curl -sSL https://get.rvm.io | bash -s stable'
su -l ubuntu -c 'source /usr/local/rvm/scripts/rvm'
su -l ubuntu -c 'rvm install 2.3.1'
su -l ubuntu -c 'rvm use 2.3.1 --default'
su -l ubuntu -c 'touch ~/.gemrc'
su -l ubuntu -c "echo 'gem: --no-rdoc --no-ri ' >> ~/.gemrc"
su -l ubuntu -c "echo 'cd /vagrant ' >> ~/.bashrc"
su -l ubuntu -c "cd /vagrant; rvm use 2.3.1@vagrant --ruby-version --create"
echo '---=== RVM INSTALLATION  END   ===---'
