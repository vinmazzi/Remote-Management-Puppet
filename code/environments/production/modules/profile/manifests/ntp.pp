class profile::ntp {

  $ntp_servers = lookup('ntp_servers', Data, 'first',undef)

  if($ntp_servers != undef) {
    class {'ntp':
      servers => $ntp_servers,
    }
  }

}
