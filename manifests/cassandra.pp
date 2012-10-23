class kanyun::cassandra {
    exec {'python /etc/puppet/modules/cassandra/files/init_cassandra_db.py':
    	  path => '/usr/bin',
	  logoutput => true ,
	  require => Class['cassandra'],
  }

}
