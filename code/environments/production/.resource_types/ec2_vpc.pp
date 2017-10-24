# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# A type representing an AWS VPC.
Puppet::Resource::ResourceType3.new(
  'ec2_vpc',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The region in which to launch the VPC.
    Puppet::Resource::Param(Any, 'region'),

    # The IP range for the VPC.
    Puppet::Resource::Param(Any, 'cidr_block'),

    # The DHCP option set to use for this VPC.
    Puppet::Resource::Param(Any, 'dhcp_options'),

    # Enable DNS support for this VPC.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'enable_dns_support'),

    # Enable DNS hostnames for this VPC.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'enable_dns_hostnames'),

    # The supported tenancy options for instances in this VPC.
    # 
    # Valid values are `default`, `dedicated`.
    Puppet::Resource::Param(Enum['default', 'dedicated'], 'instance_tenancy'),

    # The tags to assign to the VPC.
    Puppet::Resource::Param(Any, 'tags')
  ],
  [
    # The name of the VPC.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ec2_vpc`
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
