class role::puppetserver {

 $mzbox_database_name          = hiera('mzbox_database_name')
 $mzbox_database_user_name     = hiera('mzbox_database_user_name')
 $mzbox_database_user_password = hiera('mzbox_database_user_password')
 $listen_address               = $facts['networking']['interfaces']['eth0']['ip']
 
  class {'profile::base_puppetserver': }

  ->

  class{'profile::puppetdb_server':
   listen_address => $listen_address,
  }
 
  ->

  class {'profile::mcollective_middleware': }

  ->

  class {'profile::mzbox':
   mzbox_database_name          => $mzbox_database_name,
   mzbox_database_user_name     => $mzbox_database_user_name,    
   mzbox_database_user_password => $mzbox_database_user_password,
  }
}
