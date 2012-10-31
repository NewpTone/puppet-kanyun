class kanyun::api(
    $auth_host      = '0.0.0.0',
    $auth_port      = '35357',
    $auth_protocol  = 'http',
    $admin_token    = 'admin_token',
    )
{
  package { "kanyun-api":
    ensure => 'present',
  }
kanyun_config {
  'filter:auth/auth_host':      value => $auth_host,
  'filter:auth/auth_port':      value => $auth_port,
  'filter:auth/auth_protocol':  value => $auth_protocol,
  'filter:auth/admin_token':    value => $admin_token
  }

}


}
