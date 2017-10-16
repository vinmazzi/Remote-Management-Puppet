class mz::setup {
  
  $group_name = lookup('group')

  file {'/etc/group_name':
    ensure  => 'file',
    content => $group_name,
  }

}
