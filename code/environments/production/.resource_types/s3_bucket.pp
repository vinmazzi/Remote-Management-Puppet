# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing S3 buckets.
Puppet::Resource::ResourceType3.new(
  's3_bucket',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Read-only property for the date a bucket was created
    Puppet::Resource::Param(Any, 'creation_date'),

    # The policy document JSON string to apply
    Puppet::Resource::Param(Any, 'policy')
  ],
  [
    # The name of the user to manage.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `s3_bucket`
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
