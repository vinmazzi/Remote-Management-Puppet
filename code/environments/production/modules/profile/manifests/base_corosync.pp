class profile::base_corosync {

  class { 'corosync':
    authkey                   => '/etc/puppetlabs/puppet/ssl/certs/ca.pem',
    cluster_name              => "2567-cluster",
    enable_secauth            => true,
    set_votequorum            => true,
    votequorum_expected_votes => '1',
    quorum_members            => [$::fqdn],
  }

  cs_property { 'stonith-enabled' :
      value => 'false',
  }

  cs_property { 'no-quorum-policy' :
      value => 'ignore',
  }
}
