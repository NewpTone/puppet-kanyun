class kanyun::server {
  include 'kanyun::cassandra'
  package { "kanyun-server":
    ensure => 'present',
  } 
 }
