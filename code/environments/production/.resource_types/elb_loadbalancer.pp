# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing an ELB load balancer.
Puppet::Resource::ResourceType3.new(
  'elb_loadbalancer',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The region in which to launch the load balancer.
    Puppet::Resource::Param(Any, 'region'),

    # The ports and protocols the load balancer listens to.
    Puppet::Resource::Param(Any, 'listeners'),

    # The health check configuration for the load balancer
    Puppet::Resource::Param(Any, 'health_check'),

    # The tags for the load balancer.
    Puppet::Resource::Param(Any, 'tags'),

    # The region in which to launch the load balancer.
    Puppet::Resource::Param(Any, 'subnets'),

    # The security groups to associate the load balancer (VPC only).
    Puppet::Resource::Param(Any, 'security_groups'),

    # The availability zones in which to launch the load balancer.
    Puppet::Resource::Param(Any, 'availability_zones'),

    # The instances to associate with the load balancer.
    Puppet::Resource::Param(Any, 'instances'),

    # Whether the load balancer is internal or public facing.
    # 
    # Valid values are `internet-facing`, `internal`.
    Puppet::Resource::Param(Enum['internet-facing', 'internal'], 'scheme'),

    # The DNS name of the load balancer
    Puppet::Resource::Param(Any, 'dns_name')
  ],
  [
    # The name of the load balancer.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `elb_loadbalancer`
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
