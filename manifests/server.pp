class kanyun::server(
	$host = '*',
	$port = '5551',
	$db_host  = '127.0.0.1',
	$log	  = '/var/log/kanyun/kanyun-server.log'
)  {

  package { "kanyun-server":
    ensure => 'present',
  } 
  
  kanyun_config {
    'server/host':      value => $host;
	'server/port':      value => $port;
	'server/db_host':   value => $db_host;
	'server/log'    :   value => $log;
 }
