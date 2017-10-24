# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# A type representing a VPN gateway.
Puppet::Resource::ResourceType3.new(
  'ec2_vpc_vpn_gateway',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The tags to assign to the VPN gateway.
    Puppet::Resource::Param(Any, 'tags'),

    # The VPN to attach the VPN gateway to.
    Puppet::Resource::Param(Any, 'vpc'),

    # The region in which to launch the VPN gateway.
    Puppet::Resource::Param(Any, 'region'),

    # The type of VPN gateway, defaults to ipsec.1.
    Puppet::Resource::Param(Any, 'type')
  ],
  [
    # The name of the VPN gateway.
    Puppet::Resource::Param(Any, 'name', true),

    # The availability zone in which to launch the VPN gateway.
    Puppet::Resource::Param(Any, 'availability_zone'),

    # The specific backend to use for this `ec2_vpc_vpn_gateway`
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
