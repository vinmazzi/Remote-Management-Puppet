# This file was automatically generated on 2017-09-14 02:10:02 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type for manipulating corosync/pacemaker resource location.
# More information on Corosync/Pacemaker colocation can be found here:
# 
# * http://www.clusterlabs.org/doc/en-US/Pacemaker/1.1/html/Clusters_from_Scratch/_ensuring_resources_run_on_the_same_host.html
Puppet::Resource::ResourceType3.new(
  'cs_location',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The corosync resource primitive to have a location applied.
    Puppet::Resource::Param(Any, 'primitive'),

    # The corosync node_name where the resource should be located.
    Puppet::Resource::Param(Any, 'node_name'),

    # Whether Pacemaker should perform resource discovery on this
    # node for the specified resource. It matches the resource-discovery
    # location property in pacemaker
    # 
    # 
    # 
    # Requires features discovery.
    Puppet::Resource::Param(Any, 'resource_discovery'),

    # The priority of this location.  Primitives can be a part of
    # multiple location groups and so there is a way to control which
    # primitives get priority when forcing the move of other primitives.
    # This value can be an integer but is often defined as the string
    # INFINITY.
    Puppet::Resource::Param(Any, 'score'),

    # The rules of this location.  This is an array of hashes where
    # each hash contains an array of one or more expressions.
    # 
    # Example:
    # 
    #   cs_location { 'vip-ping-connected':
    #     primitive => 'vip',
    #     rules     => [
    #       'vip-ping-exclude-rule' => {
    #         'score'      => '-INFINITY',
    #         'expression' => [
    #           { 'attribute' => 'pingd',
    #             'operation' => 'lt',
    #             'value'     => '100',
    #           },
    #         ],
    #       },
    #       'vip-ping-prefer-rule'  => {
    #         'score-attribute' => 'pingd',
    #         'expression'      => [
    #           { 'attribute' => 'pingd',
    #             'operation' => 'defined',
    #           },
    #         ],
    #       },
    #     ],
    #   }
    Puppet::Resource::Param(Any, 'rules')
  ],
  [
    # Identifier of the location entry.  This value needs to be unique
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

    # The specific backend to use for this `cs_location`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # crm
    # : Specific provider for a rather specific type since I currently have no plan to
    #   abstract corosync/pacemaker vs. keepalived.  This provider will check the state
    #   of current primitive locations on the system; add, delete, or adjust various
    #   aspects.
    # 
    #   * Required binaries: `crm`.
    # 
    # pcs
    # : Specific provider for a rather specific type since I currently have no plan to
    #   abstract corosync/pacemaker vs. keepalived.  This provider will check the state
    #   of current primitive locations on the system; add, delete, or adjust various
    #   aspects.
    # 
    #   * Required binaries: `pcs`.
    #   * Default for `operatingsystem` == `fedora, centos, redhat`.
    #   * Supported features: `discovery`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
