# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing an AWS VPC customer gateways.
Puppet::Resource::ResourceType3.new(
  'ec2_vpc_customer_gateway',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The IPv4 address for the customer gateway.
    Puppet::Resource::Param(Any, 'ip_address'),

    # The Autonomous System Numbers for the customer gateway.
    Puppet::Resource::Param(Any, 'bgp_asn'),

    # The tags for the customer gateway.
    Puppet::Resource::Param(Any, 'tags'),

    # The region in which to launch the customer gateway.
    Puppet::Resource::Param(Any, 'region'),

    # The type of customer gateway, defaults to ipsec.1.
    Puppet::Resource::Param(Any, 'type')
  ],
  [
    # The name of the customer gateway.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ec2_vpc_customer_gateway`
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
