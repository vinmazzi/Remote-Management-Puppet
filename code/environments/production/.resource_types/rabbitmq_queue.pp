# This file was automatically generated on 2017-10-17 20:40:54 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Native type for managing rabbitmq queue
# 
# @example Create a rabbitmq_queue
#  rabbitmq_queue { 'myqueue@myvhost':
#    ensure      => present,
#    user        => 'dan',
#    password    => 'bar',
#    durable     => true,
#    auto_delete => false,
#    arguments   => {
#      x-message-ttl          => 123,
#      x-dead-letter-exchange => 'other'
#    },
#  }
Puppet::Resource::ResourceType3.new(
  'rabbitmq_queue',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # Name of queue
    # 
    # Values can match `/^\S*@\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S*@\S+$/], 'name', true),

    # Queue is durable
    # 
    # Values can match `/true|false/`.
    Puppet::Resource::Param(Pattern[/true|false/], 'durable'),

    # Queue will be auto deleted
    # 
    # Values can match `/true|false/`.
    Puppet::Resource::Param(Pattern[/true|false/], 'auto_delete'),

    # Queue arguments example: {x-message-ttl => 60, x-expires => 10}
    Puppet::Resource::Param(Any, 'arguments'),

    # The user to use to connect to rabbitmq
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'user'),

    # The password to use to connect to rabbitmq
    # 
    # Values can match `/\S+/`.
    Puppet::Resource::Param(Pattern[/\S+/], 'password'),

    # The specific backend to use for this `rabbitmq_queue`
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
