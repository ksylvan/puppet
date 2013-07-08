#!/bin/sh
#
echo "=== Pupper Master initialization..."
echo "=== setting certname to master..."
sudo su -c 'echo "certname=master" >> /etc/puppet/puppet.conf'
sudo service puppetmaster restart
sudo puppetca sign --all

echo "=== copying the sudo module and manifests/ files..."
sudo cp /vagrant/puppet/manifests/* /etc/puppet/manifests/
sudo cp -r /vagrant/puppet/modules/sudo /etc/puppet/modules/
sudo service puppetmaster restart