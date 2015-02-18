class websvc::params {
  $dir_path = '/etc/httpd/conf.d'

  file { "${dir_path}" :
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
