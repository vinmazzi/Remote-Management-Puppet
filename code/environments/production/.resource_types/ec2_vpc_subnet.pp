# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing a VPC Subnet.
Puppet::Resource::ResourceType3.new(
  'ec2_vpc_subnet',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The VPC to attach the subnet to.
    Puppet::Resource::Param(Any, 'vpc'),

    # The region in which to launch the subnet.
    Puppet::Resource::Param(Any, 'region'),

    # The IP address range for the subnet.
    Puppet::Resource::Param(Any, 'cidr_block'),

    # The availability zone in which to launch the subnet.
    Puppet::Resource::Param(Any, 'availability_zone'),

    # Tags to assign to the subnet.
    Puppet::Resource::Param(Any, 'tags'),

    # The route table to attach to the subnet.
    Puppet::Resource::Param(Any, 'route_table'),

    # Indicates whether instances launched in this subnet receive a public IP address.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'map_public_ip_on_launch'),

    Puppet::Resource::Param(Any, 'id')
  ],
  [
    # The name of the subnet.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ec2_vpc_subnet`
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
