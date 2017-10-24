# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing an EC2 scaling policy.
Puppet::Resource::ResourceType3.new(
  'ec2_scalingpolicy',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The amount to adjust the size of the group by.
    Puppet::Resource::Param(Any, 'scaling_adjustment'),

    # The region in which to launch the policy.
    Puppet::Resource::Param(Any, 'region'),

    # The type of policy.
    Puppet::Resource::Param(Any, 'adjustment_type'),

    # The auto scaling group to attach the policy to.
    Puppet::Resource::Param(Any, 'auto_scaling_group')
  ],
  [
    # The name of the scaling policy.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ec2_scalingpolicy`
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
