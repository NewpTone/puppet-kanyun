class kanyun::api(
    $auth_host          = '127.0.0.1',
    $admin_tenant       = 'services',
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
