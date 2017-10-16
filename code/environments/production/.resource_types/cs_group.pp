# This file was automatically generated on 2017-09-14 02:10:02 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type for manipulating Corosync/Pacemkaer group entries.
# Groups are a set or resources (primitives) that need to be
# grouped together.
# 
# More information can be found at the following link:
# 
# * http://www.clusterlabs.org/doc/en-US/Pacemaker/1.1/html/Pacemaker_Explained/ch-advanced-resources.html#group-resources
Puppet::Resource::ResourceType3.new(
  'cs_group',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # An array of primitives to have in this group.  Must be listed in the
    # order that you wish them to start.
    Puppet::Resource::Param(Any, 'primitives')
  ],
  [
    # Name identifier of this group entry.  This value needs to be unique
    # across the entire Corosync/Pacemaker configuration since it doesn't have
    # the concept of name spaces per type.
    Puppet::Resource::Param(Any, 'name', true),

    # Corosync applies its configuration immediately. Using a CIB allows
    # you to group multiple primitives and relationships to be applied at
    # once. This can be necessary to insert complex configurations into
    # Corosync correctly.
    # 
    # This paramater sets the CIB this order should be created in. A
    # cs_shadow resource with a title of the same name as this value should
    # also be added to your manifest.
    Puppet::Resource::Param(Any, 'cib'),

    # The specific backend to use for this `cs_group`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # crm
    # : Provider to add, delete, manipulate primitive groups.
    # 
    #   * Required binaries: `/usr/sbin/crm`.
    # 
    # pcs
    # : Provider to add, delete, manipulate primitive groups.
    # 
    #   * Required binaries: `/usr/sbin/pcs`.
    #   * Default for `operatingsystem` == `fedora, centos, redhat`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
