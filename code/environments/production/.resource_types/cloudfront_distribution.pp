# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing a CloudFront distribution.
Puppet::Resource::ResourceType3.new(
  'cloudfront_distribution',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Read-only unique AWS resource name assigned to the distribution
    Puppet::Resource::Param(Any, 'arn'),

    # Read-only unique distribution ID
    Puppet::Resource::Param(Any, 'id'),

    # Read-only status of the distribution
    Puppet::Resource::Param(Any, 'status'),

    # Comment for the distribution
    Puppet::Resource::Param(Any, 'comment'),

    # If the distribution is enabled
    Puppet::Resource::Param(Any, 'enabled'),

    # Price class of the distribution
    Puppet::Resource::Param(Any, 'price_class'),

    # Array of origins for the distribution
    Puppet::Resource::Param(Any, 'origins'),

    # The tags for the distribution
    Puppet::Resource::Param(Any, 'tags')
  ],
  [
    # The name of the distribution to manage.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `cloudfront_distribution`
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
