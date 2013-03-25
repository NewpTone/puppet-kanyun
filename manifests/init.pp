class kanyun(
#Mysql nova db setting
	$nova_db_username		= 'nova',
	$nova_db_passwd			= 'nova',
	$nova_db_host			= '127.0.0.1',
	$nova_db_name			= 'nova',
	$sql_connection			= '',
# Default setting
	$api_listen				= '0.0.0.0',
	$api_listen_port		= '8100',
    $api_paste_config       = '/etc/kanyun/api-paste.ini',
	$memcache				= '127.0.0.1:11211',
# Server setting
	$host       			= '*',
    $port                   = '5551',
	$db_host			    = '127.0.0.1',
# Worker setting
	$id	        			= 'worker1',
	$worker_timeout			= '60',
	$dataserver_host		= '127.0.0.1',
    $dataserver_port        = '5551',
# filter:auth setting
	$auth_host				= '0.0.0.0',
    $admin_tenant           = 'services',
    $admin_user             = 'kanyun',
    $admin_password         = 'kanyun',
){
  include 'concat::setup'

  package { 'kanyun-common':
	ensure	=> present,
#	require => Package['sws-common']
  }
#  package { 'sws-common':
#	ensure  => present,
# }
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
			sql_connection      => $sql_connection,
		    api_listen	    	=> $api_listen,	
		    api_listen_port	    => $api_listen_port,	
			api_paste_config	=> $host,
            sql_connection      => $sql_connection,
			memcache		    => $memcache,
			},
			order	=> '01',
	}	
	kanyun::config {'server':
		config => {
			host			=> $server_host,
			port			=> $host,
            db_host         => $db_host,
			},
			order	=> '02',
	}
	kanyun::config {'worker':
		config => {
			id				=> $worker_id,
			worker_timeout	=> $worker_timeout,
			dataserver_host	=> $dataserver_host,
			},
			order	=> '03',
	}		
 }
