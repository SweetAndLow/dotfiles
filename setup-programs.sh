# Author: Sean Vetter
# Date: 6/20/2014
# Description: This is a collection of programs and repos that i use to setup
# a new ubuntu computer. This isn't a script just yet.

sudo apt-get -y install git subversion vim pylint nfs-common cifs-utils ssh \
    keepass2 xdotool traceroute whois irssi rdesktop python-setuptools curl \
    iperf nfs-kernel-server tmux nmap python-unittest2

#work qa packages:
# vm_mgr requires this
python-pygresql
# make_cluster.py needs this
python-mysqldb

libwww-perl (postgresql python-pexpect) #optional because i don't konw where they are used, in parens



# PPA
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default
#GIT core
sudo add-apt-repository ppa:git-core/ppa
# SVN
sudo add-apt-repository ppa:svn/ppa

# review board tools install, requires python-setuptools
sudo easy_install -U RBTools

# wireshark install
sudo apt-get install wireshark
# configure wireshark group so users can sniff packets
sudo dpkg-reconfigure wireshark-common
# add your user to that group
sudo usermod -a -G wireshark $USER

# this is a maybe
sudo apt-get install ubuntu-restricted-extras

# libwww-perl is installed to get make_qa.pl working
