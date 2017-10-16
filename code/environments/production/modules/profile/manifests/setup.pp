class profile::setup {

  $group_file = "/etc/group_name"

  file { $group_file:
    ensure  => file,
    content => hiera('group')
  }
}
