# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing a SQS Queue
Puppet::Resource::ResourceType3.new(
  'sqs_queue',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The time in seconds that the delivery of all messages in the queue will be delayed
    Puppet::Resource::Param(Any, 'delay_seconds'),

    # The number of seconds Amazon SQS retains a message.
    Puppet::Resource::Param(Any, 'message_retention_period'),

    # The limit of how many bytes a message can contain before Amazon SQS rejects it.
    Puppet::Resource::Param(Any, 'maximum_message_size'),

    # The name of the region in which the SQS queue is located
    Puppet::Resource::Param(Any, 'region'),

    # The number of seconds during which Amazon SQS prevents other consuming components from receiving and processing a message
    Puppet::Resource::Param(Any, 'visibility_timeout')
  ],
  [
    # The name of the SQS queue
    Puppet::Resource::Param(Any, 'name', true),

    # The URL of an existing queue - read only parameter
    Puppet::Resource::Param(Any, 'url'),

    # The specific backend to use for this `sqs_queue`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # v2
    # :
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
