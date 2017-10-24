# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing IAM policy attachments.
Puppet::Resource::ResourceType3.new(
  'iam_policy_attachment',
  [
    # An array of group names the policy should be attached to
    Puppet::Resource::Param(Any, 'groups'),

    # An array of group names the policy should be attached to
    Puppet::Resource::Param(Any, 'users'),

    # An array of role names the policy should be attached to
    Puppet::Resource::Param(Any, 'roles'),

    Puppet::Resource::Param(Any, 'arn')
  ],
  [
    # The name of the policy on which to manage entity attachments.
    Puppet::Resource::Param(Any, 'name', true),

    Puppet::Resource::Param(Any, 'exclusive'),

    # The specific backend to use for this `iam_policy_attachment`
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
