# Install basic packages
for pkg in build-essential python-dev software-properties-common python-software-properties vim git grc
do
   sudo apt-get -y install $pkg
done

# Install setuptools and pip
[ ! -f /usr/local/bin/easy_install ] && /usr/bin/wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | sudo python2.7
[ ! -f /usr/local/bin/pip ] && /usr/bin/wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py -O - | sudo python2.7