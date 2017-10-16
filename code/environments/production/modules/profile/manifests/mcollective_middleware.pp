class profile::mcollective_middleware {

  include profile::activemq

  class { '::mcollective':
      client           => true,
      middleware_hosts => [ 'puppetserver.localdomain' ],
  }
}
