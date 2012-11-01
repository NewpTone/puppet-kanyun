#Mysql nova db setting
    $nova_db_username       = 'nova'
    $nova_db_passwd         = 'nova'
    $nova_db_host           = '127.0.0.1'
    $nova_db_name           = 'nova'
# Default setting
    $listen                 = '0.0.0.0'
    $host                   = '127.0.0.1'
    $memcache               = '127.0.0.1:11211'
# Server setting
    $server_host            = '*'
    $server_db_host         = '127.0.0.1'
    $server_log             = '/var/log/kanyun/kanyun-server.log'
# Worker setting
    $id                     = 'worker1'
    $worker_timeout         = '60'
    $dataserver_host        = '127.0.0.1'
    $worker_log             = '/var/log/kanyun/kanyun-worker.log'   
# filter:auth setting
    $auth_host              = '0.0.0.0'
    $admin_token			= 'admin'
class {'kanyun':
	nova_db_username		=> $nova_db_username,
	nova_db_passwd			=> $nova_db_passwd,
	nova_db_host			=> $nova_db_host,
	listen					=> $listen,
	host					=> $host,
	memcache				=> $memcache,
	server_host				=> $server_host,
	server_db_host			=> $server_db_host,
	server_log				=> $server_log,
	id						=> $id,
	worker_timeout			=> $worker_timeout,
	dataserver_host			=> $dataserver_host,		
	worker_log				=> $worker_log,
	auth_host				=> $auth_host,
	admin_token				=> $admin_token,
}

