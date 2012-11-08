class kanyun::cassandra {
	package {'python-pip':
			ensure => present,
	}
	exec { 'pip install pycassa':
			path => '/usr/bin',
			require => Package['python-pip'],
	}
	file {'/tmp/init_cassandra_db.py':
		ensure => present,
		source => 'puppet:///modules/kanyun/init_cassandra_db.py'
}
    exec {'python /tmp/init_cassandra_db.py':
		path		=> '/usr/bin',
		logoutput => true ,
  }
	File['/tmp/init_cassandra_db.py'] ~> Exec['pip install pycassa'] ~> Exec['python /tmp/init_cassandra_db.py']
}
