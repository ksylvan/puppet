#!/bin/sh
#
echo "=== Puppet Agent initialization..."
echo sudo puppet agent --verbose --no-daemonize --verbose --onetime --server=master
sudo puppet agent --verbose --no-daemonize --verbose --onetime --server=master
echo "=== Please run initialize_master.sh on the master to continue..."
echo "=== Once you have done that, hit RETURN"
read x
echo sudo puppet agent --verbose --no-daemonize --verbose --onetime --server=master
sudo puppet agent --verbose --no-daemonize --verbose --onetime --server=master
