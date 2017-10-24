# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing a Route53 DNS PTR record.
Puppet::Resource::ResourceType3.new(
  'route53_ptr_record',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The zone associated with this record.
    Puppet::Resource::Param(Any, 'zone'),

    # The time to live for the record.
    Puppet::Resource::Param(Any, 'ttl'),

    # The values of the record.
    Puppet::Resource::Param(Any, 'values'),

    # The name of the alias resource to target
    Puppet::Resource::Param(Any, 'alias_target'),

    # The ID of the zone in which the alias_target resides
    Puppet::Resource::Param(Any, 'alias_target_zone')
  ],
  [
    # The name of DNS record.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `route53_ptr_record`
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
