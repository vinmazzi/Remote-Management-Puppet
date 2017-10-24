# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing an EC2 VPC Internet Gateway.
Puppet::Resource::ResourceType3.new(
  'ec2_vpc_internet_gateway',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Tags to assign to the internet gateway.
    Puppet::Resource::Param(Any, 'tags'),

    # The region in which to launch the internet gateway.
    Puppet::Resource::Param(Any, 'region'),

    # The vpc to assign this internet gateway to.
    Puppet::Resource::Param(Any, 'vpc')
  ],
  [
    # The name of the internet gateway.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ec2_vpc_internet_gateway`
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
