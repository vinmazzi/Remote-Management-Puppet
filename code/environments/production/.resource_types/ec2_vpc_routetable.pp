# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing a VPC route table.
Puppet::Resource::ResourceType3.new(
  'ec2_vpc_routetable',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # VPC to assign the route table to.
    Puppet::Resource::Param(Any, 'vpc'),

    # Region in which to launch the route table.
    Puppet::Resource::Param(Any, 'region'),

    # Individual routes for the routing table.
    Puppet::Resource::Param(Any, 'routes'),

    # Tags to assign to the route table.
    Puppet::Resource::Param(Any, 'tags')
  ],
  [
    # The name of the route table.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ec2_vpc_routetable`
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
