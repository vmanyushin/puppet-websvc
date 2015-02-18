$domain_names = [
  'yandex.ru', 
  'vk.com'
]

Exec {
  path => '/bin:/sbin:/usr/sbin:/usr/bin',
}

each($domain_names) |$domain| {
  
  websvc::apache {"${domain}": }

  include bind

  bind::zone {"${domain}":
    ensure       => present,
    zone_contact => "postmaster.${domain}",
    zone_ns      => ["ns0.${domain}",],
    zone_serial  => '201502181400',
    zone_ttl     => '3600',
  }

  bind::a {"${domain}":
    ensure        => present,
    zone          => $domain,
    ptr           => false,
    hash_data     => {
      "${domain}" => {owner => $::ipaddress},
      'www'       => {owner => $::ipaddress},
      'ns0'       => {owner => $::ipaddress},
    }
  } 
}
