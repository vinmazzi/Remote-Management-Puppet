# This file was automatically generated on 2017-09-14 02:10:03 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manage SELinux fcontext equivalence definitions. You should use selinux::fcontext instead of this directly.
Puppet::Resource::ResourceType3.new(
  'selinux_fcontext_equivalence',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The target of the equivalence. ie. the path that this resource will be equivalent to
    Puppet::Resource::Param(Any, 'target')
  ],
  [
    # The path to set equivalence for
    Puppet::Resource::Param(Any, 'path', true),

    # The specific backend to use for this `selinux_fcontext_equivalence`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # semanage
    # : Support managing SELinux custom fcontext definitions via semanage
    # 
    #   * Required binaries: `semanage`.
    #   * Default for `kernel` == `Linux`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['path']
  },
  true,
  false)
