# This file was automatically generated on 2017-09-14 02:10:02 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manage non-volatile network configuration information
Puppet::Resource::ResourceType3.new(
  'network_config',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The IP address of the network interfaces
    Puppet::Resource::Param(Any, 'ipaddress'),

    # The subnet mask to apply to the interface
    Puppet::Resource::Param(Any, 'netmask'),

    # The method for determining an IP address for the interface
    # 
    # Valid values are `static` (also called `none`), `manual`, `dhcp`, `loopback`.
    Puppet::Resource::Param(Enum['static', 'none', 'manual', 'dhcp', 'loopback'], 'method'),

    # The address family to use for the interface
    # 
    # Valid values are `inet` (also called `inet4`), `inet6`.
    Puppet::Resource::Param(Enum['inet', 'inet4', 'inet6'], 'family'),

    # Whether to bring the interface up on boot
    Puppet::Resource::Param(Any, 'onboot'),

    # Allow/disallow hotplug support for this interface
    # 
    # 
    # 
    # Requires features hotpluggable.
    Puppet::Resource::Param(Any, 'hotplug'),

    # The Maximum Transmission Unit size to use for the interface
    Puppet::Resource::Param(Any, 'mtu'),

    # The exclusive mode the interface should operate in
    # 
    # Valid values are `raw`, `vlan`.
    Puppet::Resource::Param(Enum['raw', 'vlan'], 'mode'),

    # Provider specific options to be passed to the provider
    # 
    # 
    # 
    # Requires features provider_options.
    Puppet::Resource::Param(Any, 'options')
  ],
  [
    # The name of the physical or logical network device
    Puppet::Resource::Param(Any, 'name', true),

    # Reconfigure the interface after the configuration has been updated
    # 
    # 
    # 
    # Requires features reconfigurable.
    Puppet::Resource::Param(Any, 'reconfigure'),

    # The specific backend to use for this `network_config`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # interfaces
    # : Debian interfaces style provider
    # 
    #   * Default for `osfamily` == `debian`.
    #   * Supported features: `hotpluggable`, `provider_options`.
    # 
    # redhat
    # : Redhat network-scripts provider
    # 
    #   * Required binaries: `/usr/sbin/ifdown`, `/usr/sbin/ifup`.
    #   * Default for `osfamily` == `redhat`.
    #   * Supported features: `hotpluggable`, `provider_options`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
