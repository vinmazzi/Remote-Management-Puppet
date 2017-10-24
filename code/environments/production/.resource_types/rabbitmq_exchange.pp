# This file was automatically generated on 2017-10-17 20:40:54 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Native type for managing rabbitmq exchanges
# 
# @example Create a rabbitmq_exchange
#  rabbitmq_exchange { 'myexchange@myvhost':
#    user        => 'dan',
#    password    => 'bar',
#    type        => 'topic',
#    ensure      => present,
#    internal    => false,
#    auto_delete => false,
#    durable     => true,
#    arguments   => {
#      hash-header => 'message-distribution-hash'
#    }
#  }
Puppet::Resource::ResourceType3.new(
  'rabbitmq_exchange',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # Name of exchange
    # 
    # Values can match `/^\S*@\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S*@\S+$/], 'name', true),

    # Exchange type to be set *on creation*
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'type'),

    # Exchange durability to be set *on creation*
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'durable'),

    # Exchange auto delete option to be set *on creation*
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'auto_delete'),

    # Exchange internal option to be set *on creation*
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'internal'),

    # Exchange arguments example: {"hash-header": "message-distribution-hash"}
    Puppet::Resource::Param(Any, 'arguments'),

    # The user to use to connect to rabbitmq
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'user'),

    # The password to use to connect to rabbitmq
    # 
    # Values can match `/\S+/`.
    Puppet::Resource::Param(Pattern[/\S+/], 'password'),

    # The specific backend to use for this `rabbitmq_exchange`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # rabbitmqadmin
    # : * Required binaries: `/usr/local/bin/rabbitmqadmin`, `rabbitmqctl`.
    #   * Default for `feature` == `posix`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
