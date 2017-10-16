# This file was automatically generated on 2017-09-14 02:10:03 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# This type allows puppet to manage postgresql.conf parameters.
Puppet::Resource::ResourceType3.new(
  'postgresql_conf',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The value to set for this parameter.
    Puppet::Resource::Param(Any, 'value'),

    # The path to postgresql.conf
    Puppet::Resource::Param(Any, 'target')
  ],
  [
    # The postgresql parameter name to manage.
    # 
    # Values can match `/^[\w\.]+$/`.
    Puppet::Resource::Param(Pattern[/^[\w\.]+$/], 'name', true),

    # The specific backend to use for this `postgresql_conf`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # parsed
    # : Set key/values in postgresql.conf.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
