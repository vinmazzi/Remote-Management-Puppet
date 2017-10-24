# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing IAM groups.
Puppet::Resource::ResourceType3.new(
  'iam_group',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # An array of member user names to include in the group
    Puppet::Resource::Param(Any, 'members')
  ],
  [
    # The name of the group to manage.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `iam_group`
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
