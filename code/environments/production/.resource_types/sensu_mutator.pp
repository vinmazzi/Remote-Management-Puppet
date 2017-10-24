# This file was automatically generated on 2017-10-17 20:40:55 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manages Sensu mutators
Puppet::Resource::ResourceType3.new(
  'sensu_mutator',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Command the mutator should run
    Puppet::Resource::Param(Any, 'command'),

    # The mutator execution duration timeout in seconds (hard stop).
    Puppet::Resource::Param(Any, 'timeout')
  ],
  [
    # The name of the mutator
    Puppet::Resource::Param(Any, 'name'),

    # The base path to the client config file
    Puppet::Resource::Param(Any, 'base_path'),

    # The specific backend to use for this `sensu_mutator`
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
