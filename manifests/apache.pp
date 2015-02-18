define websvc::apache (
  $domain   = $name,
  $present  = 'file',
  $template = ''
) {

  include ::websvc::params

  file { "${websvc::params::dir_path}/httpd-proxy-${domain}.conf" :
    ensure  => $present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('websvc/httpd-proxy.conf.erb'),
  }
}
