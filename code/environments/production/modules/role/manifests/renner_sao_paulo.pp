class role::renner_sao_paulo {

  # class {'profile::base': }
  # ->
  # class {'profile::network': }
  # ->
  # class {'profile::ntp': }
  # ->
  # class {'profile::firewall': }
  # ->
  # class {'profile::mcollective_server': }
  # ->
  # class {'profile::sensu_client': }
  # ->
  # class {'profile::base_corosync': }
  # ->
  # class {'profile::container': }
  #notify {"${facts.teste}":}
  include profile::resolv_conf
  include profile::network
  include profile::base
  include profile::ntp
  include profile::dhcp
  include profile::firewall
  include profile::mcollective_server
  include profile::sensu_client
  include profile::base_corosync
  include profile::container

  #  $teste = "-----BEGIN CERTIFICATE-----
  #MIIDOzCCAiOgAwIBAgIJAI81TWjCRBVDMA0GCSqGSIb3DQEBCwUAMDQxCzAJBgNV
  #BAYTAkNBMQswCQYDVQQIDAJDQTELMAkGA1UEBwwCQ0ExCzAJBgNVBAoMAkNBMB4X
  #DTE3MTAwNTE0MzA0MFoXDTE3MTEwNDE0MzA0MFowNDELMAkGA1UEBhMCQ0ExCzAJ
  #BgNVBAgMAkNBMQswCQYDVQQHDAJDQTELMAkGA1UECgwCQ0EwggEiMA0GCSqGSIb3
  #DQEBAQUAA4IBDwAwggEKAoIBAQDZVnT6nc3+NNE0YQCfzKbPZ4zPtseKxROAuqkO
  #ji8+MrlpSAvkbkqx7PvJ2MCTS5wTIoDcFzkAYPLhAY3/JqjFPmyjFtaJfGHxXXmJ
  #Sm8g3PubcuzaWT82IbzENw1zAPFBmrqlhXtNLXmry1DcHeFK9S95eXnmjlz88DAd
  #fBMJvWA2pzYmon69z5C5zY5Kt8MJ6tpTrqDyXSRMVgIjljEZoHPknccH3yMcXJmc
  #X5wAAFSMa3rjIhpTRDgscXXn4To47/S77sAkhpYREC5L62l1ucYFtVj2xLhdtjFC
  #fHzQd/KT5S7N6wAYS1vlPEusMVnK6hvikqIfqOoTDRQlEbztAgMBAAGjUDBOMB0G
  #A1UdDgQWBBSelyWI4wXja8bWxutYoVZZqw+ldzAfBgNVHSMEGDAWgBSelyWI4wXj
  #a8bWxutYoVZZqw+ldzAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQA5
  #sx6quSIzVGFlGtw/68561Wx+508oqtWAJ3nA4Pc7Z2EDrmWx1x4c9/dEd6BriM+U
  #mg7BbPi/8cK2g2h8UlNvpVVy/z9WSNTnLD1LRdOdMoN8d5Z6sDrnpDnUHC7ulWFd
  #6dZyEeWBkSYQCsXXMvcNNseIJ0asN0rsNq5ENa2+IWRtNVtqIGG4J3esLgg+aT2V
  #/PP/XR/JuEwNhjEvMbncnFPHAQr9el69CGkeQAC5CEA2Vbv/GylWNWuSrA/txv6D
  #yFpJc1P/SLXl2T29zhNAY3lYQLrkWpRDULDCQevSs8IpNRz6hC9dQ7eSMa7RHTLu
  #85Kq3ZaI/xDo2gr6131/
  #-----END CERTIFICATE-----"
  #
  #  file {'/tmp/teste':
  #    ensure  => file,
  #    content => "$teste\n",
  #  }

  #  include profile::gluster
}
