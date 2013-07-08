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
vagrant@agent:~$ /vagrant/initialize_agent.sh

In another terminal, do:

$ vagrant ssh master
vagrant@master:~$ /vagrant/initialize_master.sh

The result will be the sudo/ module will be applied to the agent (from the
puppet master machine) and you can see that by looking at /etc/sudoers
on the agent machine.

---Kayvan Sylvan (kayvansylvan@gmail.com)
