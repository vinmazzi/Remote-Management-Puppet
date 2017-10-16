class mzbox (
  String $mzbox_database_name,          
  String $mzbox_database_user_name,
  String $mzbox_database_user_password,
){

  class {'mzbox::db':
    database_name => $mzbox_database_name,
    user_name     => $mzbox_database_user_name,
    user_pw       => $mzbox_database_user_password,
  }

}
