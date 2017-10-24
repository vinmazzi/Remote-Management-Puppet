# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing a KMS key instance.
Puppet::Resource::ResourceType3.new(
  'kms',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    Puppet::Resource::Param(Any, 'arn'),

    Puppet::Resource::Param(Any, 'key_id'),

    Puppet::Resource::Param(Any, 'enabled'),

    Puppet::Resource::Param(Any, 'description'),

    Puppet::Resource::Param(Any, 'creation_date'),

    Puppet::Resource::Param(Any, 'deletion_date'),

    # The policy document JSON string
    Puppet::Resource::Param(Any, 'policy')
  ],
  [
    # The alias name of the KMS key to manage.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `kms`
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
