#!/bin/bash

echo "#################################"
echo "  Running Extra_Server_Config.sh"
echo "#################################"
sudo su

#Test for Debian-Based Host
which apt &> /dev/null
if [ "$?" == "0" ]; then
    #These lines will be used when booting on a debian-based box
    echo -e "note: ubuntu device detected"
    #remove cloud-init software
    #apt-get purge cloud-init -y

    #Replace existing network interfaces file
    echo -e "auto lo" > /etc/network/interfaces
    echo -e "iface lo inet loopback\n\n" >> /etc/network/interfaces
    echo -e  "source /etc/network/interfaces.d/*.cfg\n" >> /etc/network/interfaces

    #Add vagrant interface
    echo -e "\n\nauto vagrant" > /etc/network/interfaces.d/vagrant.cfg
    echo -e "iface vagrant inet dhcp\n\n" >> /etc/network/interfaces.d/vagrant.cfg

    echo -e "\n\nauto eth0" > /etc/network/interfaces.d/eth0.cfg
    echo -e "iface eth0 inet dhcp\n\n" >> /etc/network/interfaces.d/eth0.cfg
fi

#Test for Fedora-Based Host
which yum &> /dev/null
if [ "$?" == "0" ]; then
    echo -e "note: fedora-based device detected"
    /usr/bin/dnf install python -y
    echo -e "DEVICE=vagrant\nBOOTPROTO=dhcp\nONBOOT=yes" > /etc/sysconfig/network-scripts/ifcfg-vagrant
    echo -e "DEVICE=eth0\nBOOTPROTO=dhcp\nONBOOT=yes" > /etc/sysconfig/network-scripts/ifcfg-eth0
fi

echo "add root SSH pub key"
if [ ! -d "/root/.ssh" ]; then
  mkdir /root/.ssh/
  chmod 700 /root/.ssh
fi
cat <<EOF > /root/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClLOG+yaylWNFNt3uLrrkE5IxwSSrI2I3bz46zg5o9/7E3ekQ8QB2v857yErtqPvAkx63S0WnrUftWReexU79YVbRm1tgBo7Lo2lRJPt7F45S6VIBUeEWeFIpfQDZeHS25IagE1jq/qwATXvNxs9RzI7yxCZlSMIO1YKQsNncgSY3y8vsIwzvMCRNvvJG9mxZKP3im4de9UGydZsBgk6YgBVA8HBnKC6h6vKRgjh/dtygeQDc1TkM0fDQ9bLUur6yZW8qwhwyzC099M/u21TdLJz2j/GwxOHSwCwExgWprF+mx4/BRzBjHO59eQAUD42H9pg8T13ewInc9+TD94MDh skamithi@skamithi-personal
EOF
chmod 400 /root/.ssh/authorized_keys

echo "Update /etc/network/interfaces"
cat <<EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto vagrant
iface vagrant inet dhcp

auto eth0
iface eth0 inet dhcp
EOF

echo "reboot PC"
shutdown -r 1
echo "#################################"
echo "   Finished"
echo "#################################"
