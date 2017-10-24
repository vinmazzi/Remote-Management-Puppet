# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# type representing an EC2 security group
Puppet::Resource::ResourceType3.new(
  'ec2_securitygroup',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # the region in which to launch the security group
    Puppet::Resource::Param(Any, 'region'),

    # rules for ingress traffic
    Puppet::Resource::Param(Any, 'ingress'),

    # the tags for the security group
    Puppet::Resource::Param(Any, 'tags'),

    # a short description of the group
    Puppet::Resource::Param(Any, 'description'),

    # A VPC to which the group should be associated
    Puppet::Resource::Param(Any, 'vpc'),

    # The unique identifier for the security group
    Puppet::Resource::Param(Any, 'id')
  ],
  [
    # the name of the security group
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ec2_securitygroup`
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
