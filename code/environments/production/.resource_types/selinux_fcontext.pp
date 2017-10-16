# This file was automatically generated on 2017-09-14 02:10:03 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manage SELinux fcontext definitions. You should use selinux::fcontext instead of this directly.
Puppet::Resource::ResourceType3.new(
  'selinux_fcontext',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The file type to match
    # 
    # Values can match `/^[abcdflps]$/`.
    Puppet::Resource::Param(Pattern[/^[abcdflps]$/], 'file_type'),

    # The SELinux type to apply to the paths
    # 
    # Valid values are `<<none>>`. Values can match `/\w+/`.
    Puppet::Resource::Param(Variant[Enum['<<none>>'], Pattern[/\w+/]], 'seltype'),

    # The SELinux user name
    # 
    # Values can match `/\w+/`.
    Puppet::Resource::Param(Pattern[/\w+/], 'seluser'),

    # The SELinux role
    # 
    # Values can match `/\w+/`.
    Puppet::Resource::Param(Pattern[/\w+/], 'selrole'),

    # The SELinux range
    # 
    # Values can match `/\w+/`.
    Puppet::Resource::Param(Pattern[/\w+/], 'selrange')
  ],
  [
    # The namevar. Should be of the format pathspec_filetype
    Puppet::Resource::Param(Any, 'title', true),

    # Path regular expression
    Puppet::Resource::Param(Any, 'pathspec'),

    # The specific backend to use for this `selinux_fcontext`
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
    /(?m-ix:(.*))/ => ['title']
  },
  true,
  false)
