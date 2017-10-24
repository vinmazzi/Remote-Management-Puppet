# This file was automatically generated on 2017-10-17 20:40:55 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manages Sensu handlers
Puppet::Resource::ResourceType3.new(
  'sensu_handler',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Type of handler
    Puppet::Resource::Param(Any, 'type'),

    # Command the handler should run
    Puppet::Resource::Param(Any, 'command'),

    # Exchange information used by the amqp type
    Puppet::Resource::Param(Any, 'exchange'),

    # Pipe information used by the transport type
    Puppet::Resource::Param(Any, 'pipe'),

    # Socket information used by the udp type
    Puppet::Resource::Param(Any, 'socket'),

    # Handler specific data massager
    Puppet::Resource::Param(Any, 'mutator'),

    # Handler filters
    Puppet::Resource::Param(Any, 'filters'),

    # Severities applicable to this handler
    Puppet::Resource::Param(Any, 'severities'),

    # Handlers this handler mutexes into
    Puppet::Resource::Param(Any, 'handlers'),

    # Handler specific config
    Puppet::Resource::Param(Any, 'config'),

    # Handler timeout
    Puppet::Resource::Param(Any, 'timeout'),

    # If events in the flapping state should be handled
    Puppet::Resource::Param(Any, 'handle_flapping'),

    # If events in the silenced state should be handled
    Puppet::Resource::Param(Any, 'handle_silenced')
  ],
  [
    # The name of the handler
    Puppet::Resource::Param(Any, 'name'),

    # The base path to the client config file
    Puppet::Resource::Param(Any, 'base_path'),

    # The specific backend to use for this `sensu_handler`
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
