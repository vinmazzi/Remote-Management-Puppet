class profile::network {

  include '::network'

  $network_config = lookup("network_interfaces")
  $network_routes = lookup("routes")

  package { "bridge-utils":
    ensure => installed,
  }

  service {"NetworkManager":
    ensure => stopped,
    enable => false,
  }

  $network_config.each | $nc | {
    network_config { $nc[0]:
      *       => $nc[1],
    }
    ~>
    exec { "/usr/sbin/ifdown ${nc[0]} && /usr/sbin/ifup ${nc[0]}":
      refreshonly => true,
    }
  }

  $network_routes.each | $nr | {
    network_route { $nr[0]:
      *       => $nr[1],
    }
  } 

  resources { 'network_config':
    purge => true,
  }

  ~>

  service {"network":
    ensure => running,
  }
}
