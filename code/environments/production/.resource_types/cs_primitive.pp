# This file was automatically generated on 2017-09-14 02:10:02 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type for manipulating Corosync/Pacemaker primitives.  Primitives
# are probably the most important building block when creating highly
# available clusters using Corosync and Pacemaker.  Each primitive defines
# an application, ip address, or similar to monitor and maintain.  These
# managed primitives are maintained using what is called a resource agent.
# These resource agents have a concept of class, type, and subsystem that
# provides the functionality.  Regretibly these pieces of vocabulary
# clash with those used in Puppet so to overcome the name clashing the
# property and parameter names have been qualified a bit for clarity.
# 
# More information on primitive definitions can be found at the following
# link:
# 
# * http://www.clusterlabs.org/doc/en-US/Pacemaker/1.1/html/Clusters_from_Scratch/_adding_a_resource.html
Puppet::Resource::ResourceType3.new(
  'cs_primitive',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # A hash of params for the primitive.  Parameters in a primitive are
    # used by the underlying resource agent, each class using them slightly
    # differently.  In ocf scripts they are exported and pulled into the
    # script as variables to be used.  Since the list of these parameters
    # are completely arbitrary and validity not enforced we simply defer
    # defining a model and just accept a hash.
    Puppet::Resource::Param(Any, 'parameters'),

    # A hash of operations for the primitive.  Operations defined in a
    # primitive are little more predictable as they are commonly things like
    # monitor or start and their values are in seconds.  Since each resource
    # agent can define its own set of operations we are going to defer again
    # and just accept a hash.  There maybe room to model this one but it
    # would require a review of all resource agents to see if each operation
    # is valid.
    Puppet::Resource::Param(Any, 'operations'),

    # A hash of utilization attributes for the primitive. If nodes are
    # also configured with available resources, and Pacemaker's placement
    # stratgey is set appropriately, then Pacemaker can place primitives on
    # nodes only where resources are available.
    # 
    # See the Pacemaker documentation:
    # 
    # http://clusterlabs.org/doc/en-US/Pacemaker/1.1/html/Pacemaker_Explained/ch11.html
    Puppet::Resource::Param(Any, 'utilization'),

    # A hash of metadata for the primitive.  A primitive can have a set of
    # metadata that doesn't affect the underlying Corosync type/provider but
    # affect that concept of a resource.  This metadata is similar to Puppet's
    # resources resource and some meta-parameters, they change resource
    # behavior but have no affect of the data that is synced or manipulated.
    Puppet::Resource::Param(Any, 'metadata'),

    # A hash of metadata for the master/slave primitive state.
    Puppet::Resource::Param(Any, 'ms_metadata'),

    # Designates if the primitive is capable of being managed in a master/slave
    # state.  This will create a new ms resource in your Corosync config and add
    # this primitive to it.  Concequently Corosync will be helpful and update all
    # your colocation and order resources too but Puppet won't.  Currenlty we unmunge
    # configuraiton entries that start with ms_ so that you don't have to account for
    # name change in all our manifests.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'promotable')
  ],
  [
    # Name identifier of primitive.  This value needs to be unique
    # across the entire Corosync/Pacemaker configuration since it doesn't have
    # the concept of name spaces per type.
    Puppet::Resource::Param(Any, 'name', true),

    # Corosync class of the primitive.  Examples of classes are lsb or ocf.
    # Lsb funtions a lot like the init provider in Puppet for services, an init
    # script is ran periodically on each host to identify status, or to start
    # and stop a particular application.  Ocf of the other hand is a script with
    # meta-data and stucture that is specific to Corosync and Pacemaker.
    Puppet::Resource::Param(Any, 'primitive_class'),

    # Corosync primitive type.  Type generally matches to the specific
    # 'thing' your managing, i.e. ip address or vhost.  Though, they can be
    # completely arbitarily named and manage any number of underlying
    # applications or resources.
    Puppet::Resource::Param(Any, 'primitive_type'),

    # Corosync primitive provider.  All resource agents used in a primitve
    # have something that provides them to the system, be it the Pacemaker or
    # redhat plugins...they're not always obvious though so currently you're
    # left to understand Corosync enough to figure it out.  Usually, if it isn't
    # obvious it is because there is only one provider for the resource agent.
    # 
    # To find the list of providers for a resource agent run the following
    # from the command line has Corosync installed:
    # 
    # * `crm configure ra providers <ra> <class>`
    Puppet::Resource::Param(Any, 'provided_by'),

    # Corosync applies its configuration immediately. Using a CIB allows
    # you to group multiple primitives and relationships to be applied at
    # once. This can be necessary to insert complex configurations into
    # Corosync correctly.
    # 
    # This paramater sets the CIB this primitive should be created in. A
    # cs_shadow resource with a title of the same name as this value should
    # also be added to your manifest.
    Puppet::Resource::Param(Any, 'cib'),

    # Metadata options that should not be managed by Puppet.
    # Examples: ['target-role', 'is-managed']
    Puppet::Resource::Param(Any, 'unmanaged_metadata'),

    # The specific backend to use for this `cs_primitive`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # crm
    # : Specific provider for a rather specific type since I currently have no
    #   plan to abstract corosync/pacemaker vs. keepalived.  Primitives in
    #   Corosync are the thing we desire to monitor; websites, ipaddresses,
    #   databases, etc, etc.  Here we manage the creation and deletion of
    #   these primitives.  We will accept a hash for what Corosync calls
    #   operations and parameters.  A hash is used instead of constucting a
    #   better model since these values can be almost anything.
    # 
    #   * Required binaries: `crm`.
    # 
    # pcs
    # : Specific provider for a rather specific type since I currently have no
    #   plan to abstract corosync/pacemaker vs. keepalived.  Primitives in
    #   Corosync are the thing we desire to monitor; websites, ipaddresses,
    #   databases, etc, etc.  Here we manage the creation and deletion of
    #   these primitives.  We will accept a hash for what Corosync calls
    #   operations and parameters.  A hash is used instead of constucting a
    #   better model since these values can be almost anything.
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
