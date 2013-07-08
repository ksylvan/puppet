group { "puppet":
      ensure => "present"
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
     content => "Welcome to your Vagrant-build virtual machine!
                 Managed by Puppet.\n\n(Puppet Agent Machine)\n"
}
file { '/etc/hosts':
     content => "127.0.0.1	localhost
127.0.1.1	precise32

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

# agent and master IP
10.0.4.4 master
10.0.4.5 agent\n"
}

package {
	[ "puppet", "facter" ]:
	ensure => present
}
