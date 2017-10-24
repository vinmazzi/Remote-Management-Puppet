# This file was automatically generated on 2017-10-17 20:40:54 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type for managing rabbitmq policies
# 
# @example Create a rabbitmq_policy
#  rabbitmq_policy { 'ha-all@myvhost':
#    pattern    => '.*',
#    priority   => 0,
#    applyto    => 'all',
#    definition => {
#      'ha-mode'      => 'all',
#      'ha-sync-mode' => 'automatic',
#    },
#  }
Puppet::Resource::ResourceType3.new(
  'rabbitmq_policy',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # policy pattern
    Puppet::Resource::Param(Any, 'pattern'),

    # policy apply to
    # 
    # Valid values are `all`, `exchanges`, `queues`.
    Puppet::Resource::Param(Enum['all', 'exchanges', 'queues'], 'applyto'),

    # policy definition
    Puppet::Resource::Param(Any, 'definition'),

    # policy priority
    # 
    # Values can match `/^\d+$/`.
    Puppet::Resource::Param(Pattern[/^\d+$/], 'priority')
  ],
  [
    # combination of policy@vhost to create policy for
    # 
    # Values can match `/^\S+@\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+@\S+$/], 'name', true),

    # The specific backend to use for this `rabbitmq_policy`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # rabbitmqctl
    # : * Default for `feature` == `posix`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
