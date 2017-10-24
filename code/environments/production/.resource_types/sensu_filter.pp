# This file was automatically generated on 2017-10-17 20:40:55 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manages Sensu filters
Puppet::Resource::ResourceType3.new(
  'sensu_filter',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Filter attributes
    Puppet::Resource::Param(Any, 'attributes'),

    # Used to determine when a filter is applied.
    Puppet::Resource::Param(Any, 'when'),

    Puppet::Resource::Param(Any, 'negate')
  ],
  [
    # The name of the filter.
    Puppet::Resource::Param(Any, 'name'),

    # The base path to the client config file
    Puppet::Resource::Param(Any, 'base_path'),

    # The specific backend to use for this `sensu_filter`
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
