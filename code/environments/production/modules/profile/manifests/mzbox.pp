class profile::mzbox (
  String $mzbox_database_name,          
  String $mzbox_database_user_name,
  String $mzbox_database_user_password,
) {

  class {'mzbox':
    mzbox_database_name          => $mzbox_database_name,
    mzbox_database_user_name     => $mzbox_database_user_name,
    mzbox_database_user_password => $mzbox_database_user_password,
  }

}
