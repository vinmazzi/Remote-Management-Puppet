class profile::sensu_server {

  $rabbitmq_pw = "secret"

  class {'rabbitmq':
    service_manage    => true,
    delete_guest_user => true,
  }

  rabbitmq_user {'sensu':
    password => $rabbitmq_pw,
    admin    => true,
    tags     => ['sensu'],
  }

  rabbitmq_vhost { 'sensu':
      ensure => present,
  }

  rabbitmq_user_permissions { 'sensu@sensu':
    configure_permission => '.*',
    read_permission      => '.*',
    write_permission     => '.*',
  }

  class { 'sensu':
    rabbitmq_password => $rabbitmq_pw,
    server            => true,
    api               => true,
    rabbitmq_ssl      => false,
  }

  class {'uchiwa':
    repo_source => 'https://sensu.global.ssl.fastly.net/yum/$releasever/$basearch/'
  }

}
