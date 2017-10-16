class profile::base_puppetserver {
  include '::network'
  @@host{ "puppetserver.localdomain":
    host_aliases => 'puppet',
    ip           => $facts['networking']['interfaces']['eth0']['ip'],
    tag          => "puppetserver_hosts_entry",
  }

  Host<<| |>>
}
