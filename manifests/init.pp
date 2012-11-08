class kanyun(
#Mysql nova db setting
	$nova_db_username		= 'nova',
	$nova_db_passwd			= 'nova',
	$nova_db_host			= '127.0.0.1',
	$nova_db_name			= 'nova',
	$sql_connection			= '',
# Default setting
	$listen					= '0.0.0.0',
	$host					= '127.0.0.1',
	$memcache				= '127.0.0.1:11211',
# Server setting
	$server_host			= '*',
	$db_host			    = '127.0.0.1',
	$server_log				= '/var/log/kanyun/kanyun-server.log',
# Worker setting
	$worker_id				= 'worker1',
	$worker_timeout			= '60',
	$dataserver_host		= '127.0.0.1',
    $worker_log				= '/var/log/kanyun/kanyun-worker.log',
# filter:auth setting
	$auth_host				= '0.0.0.0',
	$admin_token,
){
  include 'concat::setup'

  package { 'kanyun-common':
	ensure	=> present,
	require => Package['sws-common']
  }
  package { 'sws-common':
	ensure  => present,
 }
  file { '/etc/kanyun':
    ensure  => directory,
    owner   => 'kanyun',
    group   => 'kanyun',
    mode    => 0755,
    require => Package['kanyun-common'],
  }
  concat { '/etc/kanyun/kanyun.conf':
    owner   => 'kanyun',
    group   => 'kanyun',
    mode    => '0600',
    require => Package['kanyun-common'],
  }
	
#Config set 
	kanyun::config {'DEFAULT':
		config => {
			sql_connection  => $sql_connection,
		    listen			=> $listen,	
			host			=> $host,
			memcache		=> $memcache,
			},
			order	=> '01',
	}	
	kanyun::config {'server':
		config => {
			host			=> $server_host,
			db_host			=> $db_host,
			log				=> $server_log,
			},
			order	=> '02',
	}
	kanyun::config {'worker':
		config => {
			id				=> $worker_id,
			worker_timeout	=> $worker_timeout,
			dataserver_host	=> $dataserver_host,
			log				=> $worker_log,
			},
			order	=> '03',
	}		
	kanyun::config {'filter_auth':
		config => {
			auth_host		=> $auth_host,
			admin_token		=> $admin_token,
			},
			order	=> '04',
	}
 }
