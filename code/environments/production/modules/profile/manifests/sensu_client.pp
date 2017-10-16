class profile::sensu_client {

   class { 'sensu':
     rabbitmq_password  => 'secret',
     rabbitmq_host      => '192.168.1.209',
     subscriptions      => 'sensu-test',
   }
}
