# This file was automatically generated on 2017-10-17 20:40:55 -0400.
# Use the 'puppet generate types' command to regenerate this file.

Puppet::Resource::ResourceType3.new(
  'sensu_check_config',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # The check name to configure
    Puppet::Resource::Param(Any, 'name'),

    # The base path to the client config file
    Puppet::Resource::Param(Any, 'base_path'),

    # Check configuration for the client to use
    Puppet::Resource::Param(Any, 'config'),

    # Configuration to send with the event to handlers
    Puppet::Resource::Param(Any, 'event'),

    # The specific backend to use for this `sensu_check_config`
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
