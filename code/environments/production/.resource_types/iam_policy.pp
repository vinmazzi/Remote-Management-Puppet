# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing IAM policy.
Puppet::Resource::ResourceType3.new(
  'iam_policy',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The policy document JSON string
    Puppet::Resource::Param(Any, 'document'),

    Puppet::Resource::Param(Any, 'arn')
  ],
  [
    # The name of the policy to manage.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `iam_policy`
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
