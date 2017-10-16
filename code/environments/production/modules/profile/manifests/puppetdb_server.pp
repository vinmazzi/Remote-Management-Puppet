class profile::puppetdb_server (
  String $listen_address,
) {
  
  class {'puppetdb':
    listen_address          => $listen_address,
    database_listen_address => "*",
  }
}
