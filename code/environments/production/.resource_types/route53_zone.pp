# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing a Route53 DNS zone.
Puppet::Resource::ResourceType3.new(
  'route53_zone',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Whether the DNS zone is private or public. Private zones require associated VPCs.
    Puppet::Resource::Param(Any, 'is_private'),

    # AWS-generated ID of the DNS zone.
    Puppet::Resource::Param(Any, 'id'),

    # Number of records in the DNS zone.
    Puppet::Resource::Param(Any, 'record_count'),

    # Comment on the DNS zone.
    Puppet::Resource::Param(Any, 'comment'),

    # Tags on the DNS zone.
    Puppet::Resource::Param(Any, 'tags'),

    # For private zones, the associated VPCs.
    Puppet::Resource::Param(Any, 'vpcs')
  ],
  [
    # The name of DNS zone.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `route53_zone`
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
