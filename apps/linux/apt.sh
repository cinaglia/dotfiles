#!/bin/bash

# Update apt-get
sudo apt-get update
sudo apt-get upgrade

# Install basic packages
for pkg in node build-essential python-dev software-properties-common python-software-properties vim git
do
  sudo apt-get -y install $pkg
done

# Install setuptools and pip
[ ! -f /usr/local/bin/easy_install ] && /usr/bin/wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | sudo python2.7
[ ! -f /usr/local/bin/pip ] && /usr/bin/wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py -O - | sudo python2.7

# Install vcprompt
if [ ! -f /usr/local/bin/vcprompt ]; then
   wget -O /tmp/vcprompt.tar.gz https://bitbucket.org/gward/vcprompt/downloads/vcprompt-1.2.1.tar.gz
   cd /tmp && tar -xzf vcprompt.tar.gz
   cd /tmp/vcprompt-* && ./configure && make
   sudo cp /tmp/vcprompt-*/vcprompt /usr/local/bin/
   rm -rf /tmp/vcprompt*
fi
