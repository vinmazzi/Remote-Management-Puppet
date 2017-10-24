# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing an EC2 auto scaling group.
Puppet::Resource::ResourceType3.new(
  'ec2_autoscalinggroup',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The minimum number of instances in the group.
    Puppet::Resource::Param(Any, 'min_size'),

    # The maximum number of instances in the group.
    Puppet::Resource::Param(Any, 'max_size'),

    # The number of EC2 instances that should be running in the group. This number must be greater than or equal to the minimum size of the group (min_size) and less than or equal to the maximum size of the group (max_size).
    Puppet::Resource::Param(Any, 'desired_capacity'),

    # The amount of time, in seconds, after a scaling activity completes before another scaling activity can start.
    Puppet::Resource::Param(Any, 'default_cooldown'),

    # The service to use for the health checks.
    # 
    # Valid values are `EC2`, `ELB`.
    Puppet::Resource::Param(Enum['EC2', 'ELB'], 'health_check_type'),

    # The amount of time, in seconds, that Auto Scaling waits before checking the health status of an EC2 instance that has come into service. During this time, any health check failures for the instance are ignored. This parameter is required if you are adding an ELB health check.
    Puppet::Resource::Param(Any, 'health_check_grace_period'),

    # Indicates whether newly launched instances are protected from termination by Auto Scaling when scaling in.
    Puppet::Resource::Param(Any, 'new_instances_protected_from_scale_in'),

    # The region in which to launch the instances.
    Puppet::Resource::Param(Any, 'region'),

    # The launch configuration to use for the group.
    Puppet::Resource::Param(Any, 'launch_configuration'),

    # The number of instances currently running.
    Puppet::Resource::Param(Any, 'instance_count'),

    # The availability zones in which to launch the instances.
    Puppet::Resource::Param(Any, 'availability_zones'),

    # The load balancers attached to this group.
    Puppet::Resource::Param(Any, 'load_balancers'),

    # The target groups attached to this group.
    Puppet::Resource::Param(Any, 'target_groups'),

    # The termination policies attached to this group.
    Puppet::Resource::Param(Any, 'termination_policies'),

    # The subnets to associate the autoscaling group.
    Puppet::Resource::Param(Any, 'subnets'),

    # The tags for the autoscaling group.
    Puppet::Resource::Param(Any, 'tags')
  ],
  [
    # The name of the auto scaling group.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ec2_autoscalinggroup`
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
