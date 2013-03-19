class kanyun::api(
    $auth_host          = '0.0.0.0',
    $admin_tenant_name  = 'service',
    $admin_user         =  'kanyun',
    $admin_password     =  'kanyun',
    )
{
    package { "kanyun-api":
        ensure => 'present',
          }
    file  { '/etc/kanyun/api-paste.ini':  
        content => template('kanyun/api-paste.ini.erb'),
        require => Package['kanyun-api']
        }


}
