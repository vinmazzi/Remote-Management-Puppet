# This file was automatically generated on 2017-10-17 20:40:54 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Native type for managing rabbitmq bindings
# 
# @example Create a rabbitmq_binding
#  rabbitmq_binding { 'myexchange@myqueue@myvhost':
#    user             => 'dan',
#    password         => 'bar',
#    destination_type => 'queue',
#    routing_key      => '#',
#    arguments        => {},
#    ensure           => present,
#  }
# 
# @example Create bindings with same source / destination / vhost but different routing key using individual parameters
# rabbitmq_binding { 'binding 1':
#   ensure           => present,
#   source           => 'myexchange',
#   destination      => 'myqueue',
#   vhost            => 'myvhost',
#   user             => 'dan',
#   password         => 'bar',
#   destination_type => 'queue',
#   routing_key      => 'key1',
#   arguments        => {},
# }
# 
# rabbitmq_binding { 'binding 2':
#   ensure           => present,
#   source           => 'myexchange',
#   destination      => 'myqueue',
#   vhost            => 'myvhost',
#   user             => 'dan',
#   password         => 'bar',
#   destination_type => 'queue',
#   routing_key      => 'key2',
#   arguments        => {},
# }
Puppet::Resource::ResourceType3.new(
  'rabbitmq_binding',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # source of binding
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'source', true),

    # destination of binding
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'destination', true),

    # vhost
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'vhost', true),

    # binding routing_key
    # 
    # Values can match `/^\S*$/`.
    Puppet::Resource::Param(Pattern[/^\S*$/], 'routing_key', true),

    # binding destination_type
    # 
    # Values can match `/queue|exchange/`.
    Puppet::Resource::Param(Pattern[/queue|exchange/], 'destination_type'),

    # binding arguments
    Puppet::Resource::Param(Any, 'arguments')
  ],
  [
    # resource name, either source@destination@vhost or arbitrary name with params
    Puppet::Resource::Param(Any, 'name', true),

    # The user to use to connect to rabbitmq
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'user'),

    # The password to use to connect to rabbitmq
    # 
    # Values can match `/\S+/`.
    Puppet::Resource::Param(Pattern[/\S+/], 'password'),

    # The specific backend to use for this `rabbitmq_binding`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # rabbitmqadmin
    # : * Required binaries: `/usr/local/bin/rabbitmqadmin`, `rabbitmqctl`.
    #   * Default for `feature` == `posix`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(^([^@]*)$))/ => ['name'],
    /(?m-ix:^((\S+)@(\S+)@(\S+))$)/ => ['name', 'source', 'destination', 'vhost']
  },
  true,
  false)
