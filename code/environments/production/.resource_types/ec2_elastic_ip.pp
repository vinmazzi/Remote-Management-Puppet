# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing an Elastic IP and it's association.
Puppet::Resource::ResourceType3.new(
  'ec2_elastic_ip',
  [
    # Valid values are `attached`, `detached`.
    Puppet::Resource::Param(Enum['attached', 'detached'], 'ensure'),

    # The name of the region in which the Elastic IP is found.
    Puppet::Resource::Param(Any, 'region'),

    # The name of the instance associated with the Elastic IP.
    Puppet::Resource::Param(Any, 'instance')
  ],
  [
    # The IP address of the Elastic IP.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ec2_elastic_ip`
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
