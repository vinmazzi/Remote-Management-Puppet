# This file was automatically generated on 2017-09-14 02:10:02 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manage non-volatile route configuration information
Puppet::Resource::ResourceType3.new(
  'network_route',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The target network address
    Puppet::Resource::Param(Any, 'network'),

    # The subnet mask to apply to the route
    Puppet::Resource::Param(Any, 'netmask'),

    # The gateway to use for the route
    Puppet::Resource::Param(Any, 'gateway'),

    # The interface to use for the route
    Puppet::Resource::Param(Any, 'interface'),

    # Provider specific options to be passed to the provider
    # 
    # 
    # 
    # Requires features provider_options.
    Puppet::Resource::Param(Any, 'options')
  ],
  [
    # The name of the network route
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `network_route`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # redhat
    # : RHEL style routes provider
    # 
    #   * Default for `osfamily` == `redhat`.
    # 
    # routes
    # : Debian routes style provider
    # 
    #   * Default for `osfamily` == `debian`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
