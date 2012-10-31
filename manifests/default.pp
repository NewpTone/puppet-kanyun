class kanyun::default (
    $sql_connection,
    $listen                 = '0.0.0.0',
    $kanyun_composite_port  = '8100',
    $memcache               = '11211', 
)
 {
     kanyun_config {
         'DEFAULT/sql_connection':          value => $sql_connection,
         'DEFAULT/listen'        :          value => $listen,
         'DEFAULT/kanyun_composite_port':   value => $kanyun_composite_port,
         'DEFAULT/memcache'             :   value => $memcache,
 }



}
