# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing IAM instance profiles.
Puppet::Resource::ResourceType3.new(
  'iam_instance_profile',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The path of the instance profile.
    Puppet::Resource::Param(Any, 'path'),

    Puppet::Resource::Param(Any, 'arn'),

    # The roles to associate the instance profile.
    Puppet::Resource::Param(Any, 'roles')
  ],
  [
    # The name of the instance profile to manage.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `iam_instance_profile`
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
