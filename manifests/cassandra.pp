class kanyun::cassandra {
	package {'python-pip':
			ensure => present,
	}
	exec { 'pip install pycassa':
			path => '/usr/bin',
			require => Package['python-pip'],
	}
    exec {'python /etc/puppet/modules/cassandra/files/init_cassandra_db.py':
      path => '/usr/bin',
	  logoutput => true ,
  }
	Exec['pip install pycassa'] ~> Exec['python /etc/puppet/modules/cassandra/files/init_cassandra_db.py']
}
