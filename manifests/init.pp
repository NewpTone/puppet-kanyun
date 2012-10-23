class kanyun {

  apt::source { "sws_v2":
    location          => "http://10.67.21.10/swsv2",
    release           => "",
    repos             => "binary/",
    pin               => "1001",
    include_src       => false
  }

  exec { 'apt-get update':
    path                => '/usr/bin',
    refreshonly         => true,
    subscribe           => [ Apt::Source["sws_v2"]],
    logoutput           => true,
  } 
  
}
