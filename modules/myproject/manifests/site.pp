define myproject::site (
	$location = '/var/www/sourcecode',
	$database = 'dev',
	$database_user = 'root',
	$database_password = '123',
	$database_host = 'localhost'
) {
	file { $location:
		ensure => directory
	}
	file { "/etc/nginx/sites-available/$name":
		content => template('myproject/site.nginx.conf.erb'),
		notify => Service['nginx']
	}
	file { "/etc/nginx/sites-enabled/$name":
		ensure => link,
		target => "/etc/nginx/sites-available/$name",
		notify => Service['nginx']
	}
}