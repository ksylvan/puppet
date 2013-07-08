puppet
======

This repo is a Vagrant setup for learning about puppet.

Creates a "master" and "agent" precise32 (Ubuntu 12.04 i386) virtual machine.

The master is set up with Ip address 10.0.4.4 and the slave with 10.0.4.5.

Quick Start
===========

clone the repository and from the project directory, do:

$ vagrant up

This step may take a couple of minutes, depending on how powerful your
machine is. If you don't care about the Virtualbox Guest Additions version
check, you can uncomment the config.vbguest lines in the Vagrantfile. The
vbguest plugin works well but must be installed first (you can
do this by running "vagrant plugin install vagrant-vbguest")

When both VMs are up, do:

$ vagrant ssh agent
vagrant@agent:~$ sudo puppet agent --verbose --no-daemonize --verbose \
		 --onetime --server=master

In another terminal, do:

$ vagrant ssh master
vagrant@master:~$ echo 'certname=master' >> /etc/puppet/puppet.conf
vagrant@master:~$ sudo puppetca sign --all

continuing on the master:

vagrant@master:~$ sudo cp /vagrant/puppet/manifests/* /etc/puppet/manifests/
vagrant@master:~$ sudo cp -r /vagrant/puppet/modules/sudo /etc/puppet/modules/
vagrant@master:~$ sudo service puppetmaster restart

On the agent, now:

vagrant@agent:~$ sudo puppet agent --verbose --no-daemonize --verbose \
		 --onetime --server=master

---Kayvan Sylvan (kayvansylvan@gmail.com)
