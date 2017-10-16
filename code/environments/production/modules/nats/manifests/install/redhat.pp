# Manage redhat init scripts
class nats::install::redhat {

  file { "gnatsd.redhat":
    ensure  => "present",
    owner   => "root",
    group   => "root",
    mode    => "0755",
    path    => "/etc/init.d/${nats::service_name}",
    content => epp("nats/init.epp"),
  }

  Class[$name] ~> Class["nats::service"]
}
