# This file was automatically generated on 2017-09-14 02:10:02 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type for manipulating corosync/pacemaker configuration properties.
# Besides the configuration file that is managed by the module the contains
# all these related Corosync types and providers, there is a set of cluster
# properties that can be set and saved inside the CIB (A CIB being a set of
# configuration that is synced across the cluster, it can be exported as XML
# for processing and backup).  The type is pretty simple interface for
# setting key/value pairs or removing them completely.  Removing them will
# result in them taking on their default value.
# 
# More information on cluster properties can be found here:
# 
# * http://www.clusterlabs.org/doc/en-US/Pacemaker/1.1/html/Pacemaker_Explained/_cluster_options.html
# 
# P.S Looked at generating a type dynamically from the cluster's property
# meta-data that would result in a single type with puppet type properties
# of every cluster property...may still do so in a later iteration.
Puppet::Resource::ResourceType3.new(
  'cs_property',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Value of the property.  It is expected that this will be a single
    # value but we aren't validating string vs. integer vs. boolean because
    # cluster properties can range the gambit.
    Puppet::Resource::Param(Any, 'value')
  ],
  [
    # Name identifier of this property.  Simply the name of the cluster
    # property.  Happily most of these are unique.
    Puppet::Resource::Param(Any, 'name', true),

    # Corosync applies its configuration immediately. Using a CIB allows
    # you to group multiple primitives and relationships to be applied at
    # once. This can be necessary to insert complex configurations into
    # Corosync correctly.
    # 
    # This paramater sets the CIB this parameter should be created in. A
    # cs_shadow resource with a title of the same name as this value should
    # also be added to your manifest.
    Puppet::Resource::Param(Any, 'cib'),

    # Whether to replace a property that already exists on the cluster
    # whose value doesn't match what the `value` attribute specifies.  Setting
    # this to false allows cs_property resources to initialize properties without
    # overwriting future changes. Defaults to `true`.
    # 
    # Valid values are `true`, `false`, `yes`, `no`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'yes', 'no']], 'replace'),

    # The specific backend to use for this `cs_property`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # crm
    # : Specific provider for a rather specific type since I currently have no plan to
    #   abstract corosync/pacemaker vs. keepalived. This provider will check the state
    #   of Corosync cluster configuration properties.
    # 
    #   * Required binaries: `cibadmin`, `crm`.
    # 
    # pcs
    # : Specific provider for a rather specific type since I currently have no plan to
    #   abstract corosync/pacemaker vs. keepalived. This provider will check the state
    #   of Corosync cluster configuration properties.
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
