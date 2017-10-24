# This file was automatically generated on 2017-10-17 20:40:54 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# manages rabbitmq plugins
# 
# @example query all currently enabled plugins
#  $ puppet resource rabbitmq_plugin
# 
# @example Ensure a rabbitmq_plugin resource
#  rabbitmq_plugin {'rabbitmq_stomp':
#    ensure => present,
#  }
Puppet::Resource::ResourceType3.new(
  'rabbitmq_plugin',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # The name of the plugin to enable
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'name', true),

    # Sets the octal umask to be used while creating this resource
    Puppet::Resource::Param(Any, 'umask'),

    # The specific backend to use for this `rabbitmq_plugin`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # rabbitmqplugins
    # : * Required binaries: `/usr/lib/rabbitmq/bin/rabbitmq-plugins`.
    #   * Default for `feature` == `posix`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
