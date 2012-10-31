class kanyun::worker(
	$id		         = 'worker1',
	$worker_timeout  = '60',
	$dataserver_host = '127.0.0.1',
	$dataserver_port = '5551',
	$log	  	     = '/var/log/kanyun/kanyun-worker.log'
)  {

  package { "kanyun-worker":
    ensure => 'present',
  } 
 
 
  kanyun_config {
    'worker/worker_host':   value => $worker_host;
	'worker/worker_port':   value => $worker_port;
	'worker/db_host':       value => $db_host;
	'worker/log'    :       value => $log;
 }
