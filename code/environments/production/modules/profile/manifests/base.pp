class profile::base {

  include mz::setup

  @@host {$::trusted['certname']:
    ip           => $::facts['networking']['ip'],
    host_aliases => $::hostname,
  }

  Host<<|  |>>

}
