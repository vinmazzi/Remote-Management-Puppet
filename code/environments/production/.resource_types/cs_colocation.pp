# This file was automatically generated on 2017-09-14 02:10:02 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type for manipulating corosync/pacemaker colocation.  Colocation
# is the grouping together of a set of primitives so that they travel
# together when one of them fails.  For instance, if a web server vhost
# is colocated with a specific ip address and the web server software
# crashes, the ip address with migrate to the new host with the vhost.
# 
# More information on Corosync/Pacemaker colocation can be found here:
# 
# * http://www.clusterlabs.org/doc/en-US/Pacemaker/1.1/html/Clusters_from_Scratch/_ensuring_resources_run_on_the_same_host.html
Puppet::Resource::ResourceType3.new(
  'cs_colocation',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # At least two Pacemaker primitives to be located together. Order of primitives
    # in colocation groups is important. In Pacemaker, a colocation of 2 primitives
    # behaves different than a colocation between more than 2 primitives. Here the
    # behavior is altered to be more consistent.
    # Examples on how to define colocations here:
    # - 2 primitives: [A, B] will cause A to be located first, and B will be located
    #   with A. This is different than how crm configure colocation works, because
    #   there [A, B] would mean colocate A with B, thus B should be located first.
    # - multiple primitives: [A, B, C] will cause A to be located first, B next, and
    #   finally C. This is identical to how crm configure colocation works with
    #   multiple resources, it will add a colocated set.
    # Property will raise an error if you do not provide an array containing at least
    # two values. Values can be either the name of the primitive, or primitive:role.
    # Notice, we can only interpret colocations of single sets, not multiple sets
    # combined. In Pacemaker speak, this means we can support 'A B C' but not e.g.
    # 'A B (C D) E'. Feel free to contribute a patch for this.
    Puppet::Resource::Param(Any, 'primitives'),

    # The priority of this colocation.  Primitives can be a part of
    # multiple colocation groups and so there is a way to control which
    # primitives get priority when forcing the move of other primitives.
    # This value can be an integer but is often defined as the string
    # INFINITY.
    Puppet::Resource::Param(Any, 'score')
  ],
  [
    # Identifier of the colocation entry.  This value needs to be unique
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

    # The specific backend to use for this `cs_colocation`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # crm
    # : Specific provider for a rather specific type since I currently have no plan to
    #   abstract corosync/pacemaker vs. keepalived.  This provider will check the state
    #   of current primitive colocations on the system; add, delete, or adjust various
    #   aspects.
    # 
    #   * Required binaries: `crm`.
    # 
    # pcs
    # : Specific provider for a rather specific type since I currently have no plan to
    #   abstract corosync/pacemaker vs. keepalived.  This provider will check the state
    #   of current primitive colocations on the system; add, delete, or adjust various
    #   aspects.
    # 
    #   * Required binaries: `pcs`.
    #   * Default for `operatingsystem` == `fedora, centos, redhat`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
