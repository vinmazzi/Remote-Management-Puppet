# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing a DHCP option set for AWS VPC.
Puppet::Resource::ResourceType3.new(
  'ec2_vpc_dhcp_options',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Tags for the DHCP option set.
    Puppet::Resource::Param(Any, 'tags'),

    # The region in which to assign the DHCP option set.
    Puppet::Resource::Param(Any, 'region'),

    # The domain name for the DHCP options.
    Puppet::Resource::Param(Any, 'domain_name'),

    # A list of domain name servers to use for the DHCP options set.
    Puppet::Resource::Param(Any, 'domain_name_servers'),

    # A list of NTP servers to use for the DHCP options set.
    Puppet::Resource::Param(Any, 'ntp_servers'),

    # A list of netbios name servers to use for the DHCP options set.
    Puppet::Resource::Param(Any, 'netbios_name_servers'),

    # The netbios node type, the recommended value is 2 (Point-to-Point). Required if Netbios name server is used.
    Puppet::Resource::Param(Any, 'netbios_node_type')
  ],
  [
    # The name of the DHCP options set.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ec2_vpc_dhcp_options`
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
