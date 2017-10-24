# This file was automatically generated on 2017-10-17 20:40:54 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type for managing rabbitmq parameters
# 
# @example Create some rabbitmq_parameter resources
#    rabbitmq_parameter { 'documentumShovel@/':
#      component_name => '',
#      value          => {
#          'src-uri'    => 'amqp://',
#          'src-queue'  => 'my-queue',
#          'dest-uri'   => 'amqp://remote-server',
#          'dest-queue' => 'another-queue',
#      },
#    }
#    rabbitmq_parameter { 'documentumFed@/':
#      component_name => 'federation-upstream',
#      value          => {
#          'uri'     => 'amqp://myserver',
#          'expires' => '360000',
#      },
#    }
Puppet::Resource::ResourceType3.new(
  'rabbitmq_parameter',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The component_name to use when setting parameter, eg: shovel or federation
    Puppet::Resource::Param(Any, 'component_name'),

    # A hash of values to use with the component name you are setting
    Puppet::Resource::Param(Any, 'value')
  ],
  [
    # combination of name@vhost to set parameter for
    # 
    # Values can match `/^\S+@\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+@\S+$/], 'name', true),

    # The specific backend to use for this `rabbitmq_parameter`
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
