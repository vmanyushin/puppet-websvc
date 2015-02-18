# == Class: websvc
#
# Full description of class websvc here
#
# === Parameters
# === Variables
# === Authors
#
# root <root@localhost>
#
# === Copyright
#
# Copyright 2015 root
#

class websvc ($domain){
  service { 'httpd' :
    ensure => running,
    enable => true,
  }
    
}
