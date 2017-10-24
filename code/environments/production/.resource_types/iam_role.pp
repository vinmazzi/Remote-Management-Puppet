# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing IAM role.
Puppet::Resource::ResourceType3.new(
  'iam_role',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The path to the role.
    Puppet::Resource::Param(Any, 'path'),

    # The policy document JSON string
    Puppet::Resource::Param(Any, 'policy_document'),

    Puppet::Resource::Param(Any, 'arn')
  ],
  [
    # The name of the role to manage.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `iam_role`
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
