puppet
======

This repo is a Vagrant setup for learning about puppet.

Creates a "master" and "agent" precise32 (Ubuntu 12.04 i386) virtual machine.

The master is set up with IP address 10.0.4.4 and the slave with 10.0.4.5.

Requirements
------------
* VirtualBox <http://www.virtualbox.com>
* Vagrant <http://www.vagrantup.com>
* Git <http://git-scm.com/>

Quick Start
-----------

clone the repository and from the project directory, and then:

    $ vagrant up

This step may take a couple of minutes, depending on how powerful your
machine is.

When both VMs are up, do:

    $ vagrant ssh agent
    vagrant@agent:~$ /vagrant/initialize_agent.sh

In another terminal, do:

    $ vagrant ssh master
    vagrant@master:~$ /vagrant/initialize_master.sh

The result will be the sudo/ module will be applied to the agent (from the
puppet master machine) and you can see that by looking at /etc/sudoers
on the agent machine.

Virtualbox Guest Additions
--------------------------

If you have the vagrant-vbguest plugin installed, and you don't want
the auto-update to happen (to have the VMs start up faster), you can
uncomment the config.vbguest lines in the Vagrantfile.

**Kayvan Sylvan (kayvansylvan@gmail.com)**
