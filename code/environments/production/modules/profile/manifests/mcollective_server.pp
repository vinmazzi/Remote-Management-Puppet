# ESTA É A INSTANCIA QUE RODA NOS NODES!!!!! SERVER(NO MCOLLETIVE)==CLIENT(NO SENTIDO GERAL DO CLIENT)
class profile::mcollective_server {
  class { '::mcollective':
      middleware_hosts => [ 'puppetserver.localdomain' ],
      site_libdir      => '/opt/puppetlabs/mcollective/mcollective',
      core_libdir      => '/opt/puppetlabs/mcollective/',
  }

  mcollective::plugin {'puppet':
    source => 'puppet:///modules/mcollective/plugins/puppet',
  }
}
