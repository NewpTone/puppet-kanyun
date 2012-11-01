define kanyun::config(
  $config    = {}, 
  $content   = template("kanyun/${name}.erb"),
  $order     = undef,
  $target	 = '/etc/kanyun/kanyun.conf'
) {
  concat::fragment { "kanyun-${name}":
    target  => $target,
    content => $content,
    order   => $order,
  }
}
