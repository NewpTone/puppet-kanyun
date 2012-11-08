class kanyun::cassandra {
	exec { 'pip install pycassa':
			path => '/usr/bin',
			require => Package['python-pip'],
		}
    exec {'python /etc/puppet/modules/cassandra/files/init_cassandra_db.py':
      path => '/usr/bin',
	  logoutput => true ,
	  require => Class['cassandra'],
	  subscribe  => Exec['pip install pycassa'],
  }
}
