#!/bin/sh
#
echo "=== Pupper Master initialization..."
if [ ! -r $HOME/.master ]
then
  echo "=== setting certname to master..."
  sudo su -c 'echo "certname=master" >> /etc/puppet/puppet.conf'
  sudo service puppetmaster restart
  sudo puppetca sign --all

  echo "=== copying the sudo module and manifests/ files..."
  sudo cp /vagrant/puppet/manifests/* /etc/puppet/manifests/
  sudo cp -r /vagrant/puppet/modules/sudo /etc/puppet/modules/
  sudo service puppetmaster restart
  touch $HOME/.master
else
  echo "Looks like the initialization of master has been run already."
  echo "Nothing to do."
fi
