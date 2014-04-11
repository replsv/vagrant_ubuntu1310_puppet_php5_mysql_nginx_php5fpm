class myproject {
	if ! defined(Package['nginx']) {
		package {'nginx':
			ensure => latest
		}
	}
	if ! defined(Package['php5-fpm']) {
		package {'php5-fpm':
			ensure => latest
		}
	}
	if ! defined(Package['php5-memcache']) {
		package {'php5-memcache':
			ensure => latest
		}
		package {'php5-memcached':
			ensure => latest
		}
	}
	if ! defined(Package['php5-xcache']) {
		package {'php5-xcache':
			ensure => latest
		}
	}
	if ! defined(Package['php5-gd']) {
		package {'php5-gd':
			ensure => latest
		}
	}
	if ! defined(Package['php5-curl']) {
		package {'php5-curl':
			ensure => latest
		}
	}
	if ! defined(Package['php5-mcrypt']) {
		package {'php5-mcrypt':
			ensure => latest
		}
	}
	if ! defined(Package['php5-json']) {
		package {'php5-json':
			ensure => latest
		}
	}

	service { 'nginx':
		ensure     => running,
		enable     => true,
		hasrestart => true,
		restart    => '/etc/init.d/nginx reload',
		require    => Package['nginx']
	}
}