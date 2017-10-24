# This file was automatically generated on 2017-10-17 20:40:55 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manages Sensu client subscriptions
Puppet::Resource::ResourceType3.new(
  'sensu_client_subscription',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Subscriptions included, defaults to resource name
    Puppet::Resource::Param(Any, 'subscriptions'),

    # Custom client variables
    Puppet::Resource::Param(Any, 'custom')
  ],
  [
    # The subscription name
    Puppet::Resource::Param(Any, 'name', true),

    # The base path to the client config file
    Puppet::Resource::Param(Any, 'base_path'),

    # The specific backend to use for this `sensu_client_subscription`
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
