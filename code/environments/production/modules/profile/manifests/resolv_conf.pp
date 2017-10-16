class profile::resolv_conf {

  $resolv_config = lookup('dnsclient_config')

  class {'resolv_conf':
    * => $resolv_config,
  }

}
