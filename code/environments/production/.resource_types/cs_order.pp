# This file was automatically generated on 2017-09-14 02:10:02 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type for manipulating Corosync/Pacemkaer ordering entries.  Order
# entries are another type of constraint that can be put on sets of
# primitives but unlike colocation, order does matter.  These designate
# the order at which you need specific primitives to come into a desired
# state before starting up a related primitive.
# 
# More information can be found at the following link:
# 
# * http://www.clusterlabs.org/doc/en-US/Pacemaker/1.1/html/Clusters_from_Scratch/_controlling_resource_start_stop_ordering.html
Puppet::Resource::ResourceType3.new(
  'cs_order',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # First Corosync primitive.  Just like colocation, our primitives for
    # ording come in pairs but this time order matters so we need to define
    # which primitive starts the desired state change chain.
    Puppet::Resource::Param(Any, 'first'),

    # Second Corosync primitive.  Our second primitive will move to the
    # desired state after the first primitive.
    Puppet::Resource::Param(Any, 'second'),

    # The priority of the this ordered grouping.  Primitives can be a part
    # of multiple order groups and so there is a way to control which
    # primitives get priority when forcing the order of state changes on
    # other primitives.  This value can be an integer but is often defined
    # as the string INFINITY.
    Puppet::Resource::Param(Any, 'score'),

    # How to enforce the constraint.
    # 
    # Allowed values:
    # - Optional: Just a suggestion. Only applies if both resources are executing
    # the specified actions. Any change in state by the first resource will have
    # no effect on the then resource.
    # - Mandatory: Always. If first does not perform first-action, then will not
    # be allowed to performed then-action. If first is restarted, then
    # (if running) will be stopped beforehand and started afterward.
    # - Serialize: Ensure that no two stop/start actions occur concurrently for
    # the resources. First and then can start in either order, but one must
    # complete starting before the other can be started. A typical use case is
    # when resource start-up puts a high load on the host.
    # 
    # 
    # 
    # Requires features kindness.
    Puppet::Resource::Param(Any, 'kind'),

    # Boolean specifying if the resources should stop in reverse order.
    # Default value: true.
    Puppet::Resource::Param(Any, 'symmetrical')
  ],
  [
    # Name identifier of this ordering entry.  This value needs to be unique
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

    # The specific backend to use for this `cs_order`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # crm
    # : Specific provider for a rather specific type since I currently have no plan to
    #   abstract corosync/pacemaker vs. keepalived. This provider will check the state
    #   of current primitive start orders on the system; add, delete, or adjust various
    #   aspects.
    # 
    #   * Required binaries: `crm`.
    # 
    # pcs
    # : Specific provider for a rather specific type since I currently have no plan to
    #   abstract corosync/pacemaker vs. keepalived. This provider will check the state
    #   of current primitive start orders on the system; add, delete, or adjust various
    #   aspects.
    # 
    #   * Required binaries: `pcs`.
    #   * Default for `operatingsystem` == `fedora, centos, redhat`.
    #   * Supported features: `kindness`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
