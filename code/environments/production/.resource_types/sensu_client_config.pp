# This file was automatically generated on 2017-10-17 20:40:55 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manages Sensu client config
Puppet::Resource::ResourceType3.new(
  'sensu_client_config',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    Puppet::Resource::Param(Any, 'client_name'),

    Puppet::Resource::Param(Any, 'address'),

    Puppet::Resource::Param(Any, 'subscriptions'),

    # An array of strings that should be redacted in the sensu client config
    Puppet::Resource::Param(Any, 'redact'),

    # A set of attributes that configure the Sensu client socket.
    Puppet::Resource::Param(Any, 'socket'),

    # Require checks to be defined on server and client
    Puppet::Resource::Param(Any, 'safe_mode'),

    # Custom client attributes
    Puppet::Resource::Param(Any, 'custom'),

    # Enable client de-registration
    Puppet::Resource::Param(Any, 'deregister'),

    # Client deregistration attributes
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'deregistration'),

    # Keepalive config
    Puppet::Resource::Param(Any, 'keepalive'),

    # A set of attributes that configure the Sensu client http socket.
    Puppet::Resource::Param(Any, 'http_socket'),

    # Configure Service Now integration on Sensu client.
    Puppet::Resource::Param(Any, 'servicenow'),

    # Configure ec2 integration on Sensu client.
    Puppet::Resource::Param(Any, 'ec2'),

    # Configure Chef integration on Sensu client.
    Puppet::Resource::Param(Any, 'chef'),

    # Configure Puppet integration on Sensu client.
    Puppet::Resource::Param(Any, 'puppet')
  ],
  [
    # The name of the host
    Puppet::Resource::Param(Any, 'name'),

    # The base path to the client config file
    Puppet::Resource::Param(Any, 'base_path'),

    # The specific backend to use for this `sensu_client_config`
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
