class kanyun::worker {

  package { "kanyun-worker":
    ensure => 'present',
  } 
 
  kanyun_config {
    'worker/worker_host':   value => $worker_host;
	'worker/worker_port':   value => $worker_port;
	'worker/db_host':       value => $db_host;
	'worker/log'    :       value => $log;
 }
