#Mysql nova db setting
    $nova_db_username       = 'nova'
    $nova_db_passwd         = 'nova'
    $nova_db_host           = 'localhost'
    $nova_db_name           = 'nova'
# Default setting
    $listen                 = '0.0.0.0'
    $host                   = '192.168.1.1'
    $memcache               = '127.0.0.1:11211'
# Server setting
    $server_host            = '0.0.0.0'
    $server_db_host         = '127.0.0.1'
    $server_log             = '/var/log/kanyun/kanyun-server.log'
# Worker setting
    $worker_id              = 'worker2'
    $worker_timeout         = '30'
    $dataserver_host        = '127.0.0.1'
    $worker_log             = '/var/log/kanyun/kanyun-worker.log'   
# filter:auth setting
    $auth_host              = '127.0.0.1'
    $admin_token			= 'ADMIN'
node /kanyun_all/ {
class {'kanyun':
	nova_db_username		=> $nova_db_username,
	nova_db_passwd			=> $nova_db_passwd,
	nova_db_host			=> $nova_db_host,
	listen					=> $listen,
	host					=> $host,
	memcache				=> $memcache,
	server_host				=> $server_host,
	db_host					=> $server_db_host,
	server_log				=> $server_log,
	worker_id				=> $worker_id,
	worker_timeout			=> $worker_timeout,
	dataserver_host			=> $dataserver_host,		
	worker_log				=> $worker_log,
	auth_host				=> $auth_host,
	admin_token				=> $admin_token,
	sql_connection			=> "mysql://${nova_db_username}:${nova_db_passwd}@${nova_db_host}/${nova_db_name}",
}

class {'kanyun::api':}

class {'kanyun::worker':}

class {'kanyun::server':}

}
