# This file was automatically generated on 2017-10-17 20:40:55 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manages Sensu Redis config
Puppet::Resource::ResourceType3.new(
  'sensu_redis_config',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The port that Redis is listening on
    Puppet::Resource::Param(Any, 'port'),

    # The hostname that Redis is listening on
    Puppet::Resource::Param(Any, 'host'),

    # The password used to connect to Redis
    Puppet::Resource::Param(Any, 'password'),

    # Attempt to reconnect to RabbitMQ on error
    Puppet::Resource::Param(Any, 'reconnect_on_error'),

    # The Redis instance DB to use/select
    Puppet::Resource::Param(Any, 'db'),

    # Reconnect to Redis in the event of a connection failure
    Puppet::Resource::Param(Any, 'auto_reconnect'),

    # Redis Sentinel configuration for HA clustering
    Puppet::Resource::Param(Any, 'sentinels'),

    # Redis master name in the sentinel configuration
    Puppet::Resource::Param(Any, 'master')
  ],
  [
    # This value has no effect, set it to what ever you want.
    Puppet::Resource::Param(Any, 'name'),

    # The base path to the client config file
    Puppet::Resource::Param(Any, 'base_path'),

    # The specific backend to use for this `sensu_redis_config`
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
