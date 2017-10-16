class profile::razor {

  class { 'postgresql::globals':
    manage_package_repo => true,
    version             => '9.2',
  }
  
  ->
  
  class { 'postgresql::server': }
  
  postgresql::server::db { 'razor_prd':
    user     => 'razor',
    password => postgresql_password('razor', 'secret'),
  }

  package {'razor-server':
    ensure => installed,
  }
}
