# This file was automatically generated on 2017-09-14 02:10:02 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type for manipulating corosync/pacemaker resource clone.
# More information on Corosync/Pacemaker colocation can be found here:
# 
# * http://www.clusterlabs.org/doc/en-US/Pacemaker/1.1/html/Clusters_from_Scratch/_ensuring_resources_run_on_the_same_host.html
Puppet::Resource::ResourceType3.new(
  'cs_clone',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The corosync resource primitive to be cloned.
    Puppet::Resource::Param(Any, 'primitive'),

    # The corosync resource group to be cloned.
    Puppet::Resource::Param(Any, 'group'),

    # How many copies of the resource to start.
    # Defaults to the number of nodes in the cluster.
    # 
    # Valid values are `absent`. Values can match `/\d+/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/\d+/]], 'clone_max'),

    # How many copies of the resource can be started on a single node.
    # Defaults to 1.
    # 
    # Valid values are `absent`. Values can match `/\d+/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/\d+/]], 'clone_node_max'),

    # When stopping or starting a copy of the clone, tell all the other copies beforehand
    # and when the action was successful.
    # Allowed values: true, false
    # 
    # Valid values are `true`, `false`, `absent`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'absent']], 'notify_clones'),

    # Does each copy of the clone perform a different function?
    # Allowed values: true, false
    # 
    # Valid values are `true`, `false`, `absent`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'absent']], 'globally_unique'),

    # Should the copies be started in series (instead of in parallel). Allowed values: true, false
    # 
    # Valid values are `true`, `false`, `absent`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'absent']], 'ordered'),

    # Changes the behavior of ordering constraints (between clones/masters) so that instances can start/stop
    # as soon as their peer instance has (rather than waiting for every instance of the other clone has).
    # Allowed values: true, false
    # 
    # Valid values are `true`, `false`, `absent`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'absent']], 'interleave')
  ],
  [
    # Identifier of the clone entry. This value needs to be unique
    # across the entire Corosync/Pacemaker configuration since it doesn't have
    # the concept of name spaces per type.
    Puppet::Resource::Param(Any, 'name', true),

    # Corosync applies its configuration immediately. Using a CIB allows
    # you to group multiple primitives and relationships to be applied at
    # once. This can be necessary to insert complex configurations into
    # Corosync correctly.
    # 
    # This paramater sets the CIB this colocation should be created in. A
    # cs_shadow resource with a title of the same name as this value should
    # also be added to your manifest.
    Puppet::Resource::Param(Any, 'cib'),

    # The specific backend to use for this `cs_clone`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # crm
    # : Provider to add, delete, manipulate primitive clones.
    # 
    #   * Required binaries: `crm_attribute`, `crm`.
    # 
    # pcs
    # : Provider to add, delete, manipulate primitive clones.
    # 
    #   * Required binaries: `cibadmin`, `pcs`.
    #   * Default for `operatingsystem` == `fedora, centos, redhat`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
