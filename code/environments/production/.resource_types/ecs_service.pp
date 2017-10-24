# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing ECS services.
Puppet::Resource::ResourceType3.new(
  'ecs_service',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Read-only unique AWS resource name assigned to the ECS service
    Puppet::Resource::Param(Any, 'arn'),

    # Read-only status of the ECS service
    Puppet::Resource::Param(Any, 'status'),

    # An array of hashes representing load balancers assigned to a service.
    Puppet::Resource::Param(Any, 'load_balancers'),

    # A count of this service that should be running
    Puppet::Resource::Param(Any, 'desired_count'),

    # Read-only count of the running ECS tasks on the cluster
    Puppet::Resource::Param(Any, 'running_count'),

    # Read-only count of the tasks in a pending state on the cluster
    Puppet::Resource::Param(Any, 'pending_count'),

    Puppet::Resource::Param(Any, 'task_definition'),

    # The deployment configuration of the service.
    # 
    # A hash with the keys of "maximum_percent" and "minimum_healthy_percent"
    # with integer values represnting percent.
    Puppet::Resource::Param(Any, 'deployment_configuration'),

    # The short name of the role to assign to the cluster upon creation.
    Puppet::Resource::Param(Any, 'role'),

    # Read-only unique AWS resource name of the role for the service
    Puppet::Resource::Param(Any, 'role_arn'),

    # The name of the cluster to assign the service to
    Puppet::Resource::Param(Any, 'cluster')
  ],
  [
    # The name of the cluster to manage.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ecs_service`
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
