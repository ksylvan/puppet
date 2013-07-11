#!/bin/sh
#
echo "=== Puppet Agent initialization..."
if [ ! -r $HOME/.agent ]
then
  echo sudo puppet agent --verbose --no-daemonize --verbose --onetime \
    --server=master
  sudo puppet agent --verbose --no-daemonize --verbose --onetime --server=master

  echo "=== Please run initialize_master.sh on the master to continue..."
  echo "=== Once you have done that, hit RETURN"
  read x

  echo sudo puppet agent --verbose --no-daemonize --verbose --onetime \
    --server=master

  sudo puppet agent --verbose --no-daemonize --verbose --onetime --server=master
  touch $HOME/.agent
else
  echo "Looks like agent has already been initialized."
  echo "Use the following command to do a one-time catalog run:"
  echo sudo puppet agent --verbose --no-daemonize --verbose --onetime \
    --server=master
fi
