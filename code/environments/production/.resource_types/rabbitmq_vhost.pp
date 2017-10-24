# This file was automatically generated on 2017-10-17 20:40:54 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Native type for managing rabbitmq vhosts
# 
# @example query all current vhosts
#  $ puppet resource rabbitmq_vhost`
# 
# @example Create a rabbitmq_vhost
#  rabbitmq_vhost { 'myvhost':
#    ensure => present,
#  }
Puppet::Resource::ResourceType3.new(
  'rabbitmq_vhost',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # The name of the vhost to add
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'name', true),

    # The specific backend to use for this `rabbitmq_vhost`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # rabbitmqctl
    # : * Required binaries: `rabbitmqctl`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
