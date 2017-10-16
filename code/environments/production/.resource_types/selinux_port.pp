# This file was automatically generated on 2017-09-14 02:10:03 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manage SELinux port definitions. You should use selinux::port instead of this directly.
Puppet::Resource::ResourceType3.new(
  'selinux_port',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The low end of the port range to manage
    Puppet::Resource::Param(Any, 'low_port'),

    # The high end of the port range to manage
    Puppet::Resource::Param(Any, 'high_port'),

    # The protocol of the SELinux port definition
    # 
    # Valid values are `tcp`, `udp`.
    Puppet::Resource::Param(Enum['tcp', 'udp'], 'protocol'),

    # The SELinux type of the SELinux port definition
    Puppet::Resource::Param(Any, 'seltype'),

    # Source of the port configuration - either policy or local
    # 
    # Valid values are `policy`, `local`.
    Puppet::Resource::Param(Enum['policy', 'local'], 'source')
  ],
  [
    # Should be of the form "protocol_lowport-highport" or the type may misbehave
    Puppet::Resource::Param(Any, 'title', true),

    # The specific backend to use for this `selinux_port`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # semanage
    # : Support managing SELinux custom port definitions via semanage
    # 
    #   * Required binaries: `python`, `semanage`.
    #   * Default for `kernel` == `Linux`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['title']
  },
  true,
  false)
