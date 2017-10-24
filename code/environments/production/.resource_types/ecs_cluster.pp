# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing ECS clusters.
Puppet::Resource::ResourceType3.new(
  'ecs_cluster',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Read-only unique AWS resource name assigned to the cluster
    Puppet::Resource::Param(Any, 'arn'),

    # Read-only status of the ECS cluster
    Puppet::Resource::Param(Any, 'status'),

    # Read-only count of the registerd containers for the cluster
    Puppet::Resource::Param(Any, 'registered_container_instances_count'),

    # Read-only count of the running ECS tasks on the cluster
    Puppet::Resource::Param(Any, 'running_tasks_count'),

    # Read-only count of the tasks in a pending state on the cluster
    Puppet::Resource::Param(Any, 'pending_tasks_count'),

    # Read-only count of the number of services in an active state
    Puppet::Resource::Param(Any, 'active_services_count')
  ],
  [
    # The name of the cluster to manage.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ecs_cluster`
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
