exec { 'apt-get update':
	path => '/usr/bin',
}
package {'memcached':
	ensure => latest
}
package {'php5-fpm':
	ensure => latest
}
package {'phpmyadmin':
	ensure => latest
}
package {'git':
	ensure => latest
}
package {'build-essential':
	ensure => latest
}
package {'curl':
	ensure => latest
}
package {'vim':
	ensure => latest
}
class { 'mysql::php':
	require => [ Class['mysql::server'], Package['php5-fpm'] ],
}
class { 'mysql::server':
	config_hash => { 'root_password' => '123' }
}

file { '/var/www':
	ensure => directory
}

file { "/home/vagrant/.bashrc":
    mode => 644,
    ensure => file,
    source => "puppet:///modules/myproject/bashrc",
}

class {'myproject': }
myproject::site {'devapp.dev':
	location => '/var/www/sourcecode',
	require  => [ Class['mysql::server'], Package['php5-fpm'], Class['mysql::php'] ]
}