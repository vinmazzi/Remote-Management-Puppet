# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing ECS clusters.
Puppet::Resource::ResourceType3.new(
  'ecs_task_definition',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Read-only unique AWS resource name assigned to the ECS service
    Puppet::Resource::Param(Any, 'arn'),

    # Read-only revision number of the task definition
    Puppet::Resource::Param(Any, 'revision'),

    # An array of hashes to handle for the task
    Puppet::Resource::Param(Any, 'volumes'),

    # An array of hashes representing the container definition
    Puppet::Resource::Param(Any, 'container_definitions'),

    # The short name or full ARN of the IAM role that containers in this task can assume.
    Puppet::Resource::Param(Any, 'role')
  ],
  [
    # The name of the task to manage.
    Puppet::Resource::Param(Any, 'name', true),

    # Take the image into consideration when comparing the containers
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'replace_image'),

    # The specific backend to use for this `ecs_task_definition`
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
