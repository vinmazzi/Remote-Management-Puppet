class mzbox::db (
  String $database_name,
  String $user_name,
  String $user_pw,
) {

  postgresql::server::db { $database_name:
    user     => $user_name,
    password => $user_pw,
  }

}
