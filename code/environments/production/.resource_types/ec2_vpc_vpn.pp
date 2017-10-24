# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing an AWS Virtual Private Networks.
Puppet::Resource::ResourceType3.new(
  'ec2_vpc_vpn',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The VPN gateway to attach to the VPN.
    Puppet::Resource::Param(Any, 'vpn_gateway'),

    # The customer gateway to attach to the VPN.
    Puppet::Resource::Param(Any, 'customer_gateway'),

    # The type of VPN gateway, defaults to ipsec.1.
    Puppet::Resource::Param(Any, 'type'),

    # The list of routes for the VPN.
    Puppet::Resource::Param(Any, 'routes'),

    # Whether or not to use static routes, defaults to true.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'static_routes'),

    # The region in which to launch the VPN.
    Puppet::Resource::Param(Any, 'region'),

    # The tags for the VPN.
    Puppet::Resource::Param(Any, 'tags')
  ],
  [
    # The name of the VPN.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ec2_vpc_vpn`
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
