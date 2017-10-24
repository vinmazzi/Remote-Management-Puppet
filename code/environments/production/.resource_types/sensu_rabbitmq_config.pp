# This file was automatically generated on 2017-10-17 20:40:55 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manages Sensu RabbitMQ config
Puppet::Resource::ResourceType3.new(
  'sensu_rabbitmq_config',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Enable SSL transport to connect to RabbitMQ
    Puppet::Resource::Param(Any, 'ssl_transport'),

    # The path on disk to the SSL private key needed to connect to RabbitMQ
    Puppet::Resource::Param(Any, 'ssl_private_key'),

    # The path on disk to the SSL cert chain needed to connect to RabbitMQ
    Puppet::Resource::Param(Any, 'ssl_cert_chain'),

    # The port that RabbitMQ is listening on
    Puppet::Resource::Param(Any, 'port'),

    # The hostname that RabbitMQ is listening on
    Puppet::Resource::Param(Any, 'host'),

    # The username to use when connecting to RabbitMQ
    Puppet::Resource::Param(Any, 'user'),

    # The password to use when connecting to RabbitMQ
    Puppet::Resource::Param(Any, 'password'),

    # The vhost to use when connecting to RabbitMQ
    Puppet::Resource::Param(Any, 'vhost'),

    # The RabbitMQ heartbeat value
    Puppet::Resource::Param(Any, 'heartbeat'),

    # The RabbitMQ AMQP consumer prefetch value
    Puppet::Resource::Param(Any, 'prefetch'),

    # Rabbitmq Cluster
    Puppet::Resource::Param(Any, 'cluster')
  ],
  [
    # This value has no effect, set it to what ever you want.
    Puppet::Resource::Param(Any, 'name'),

    # The base path to the client config file
    Puppet::Resource::Param(Any, 'base_path'),

    # The specific backend to use for this `sensu_rabbitmq_config`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # json
    # :
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
