# This file was automatically generated on 2017-09-14 02:10:02 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type for manipulating corosync/pacemaker global defaults for
# resource options. The type is pretty simple interface for setting
# key/value pairs or removing them completely.  Removing them will result
# in them taking on their default value.
# 
# More information on resource defaults can be found here:
# 
# * http://clusterlabs.org/doc/en-US/Pacemaker/1.1/html/Pacemaker_Explained/s-resource-defaults.html
# * http://clusterlabs.org/doc/en-US/Pacemaker/1.1/html/Pacemaker_Explained/s-resource-options.html
Puppet::Resource::ResourceType3.new(
  'cs_rsc_defaults',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Value of the property.  It is expected that this will be a single
    # value but we aren't validating string vs. integer vs. boolean because
    # resource options can range the gambit.
    Puppet::Resource::Param(Any, 'value')
  ],
  [
    # Name identifier of this property.  Simply the name of the resource
    # option.  Happily most of these are unique.
    Puppet::Resource::Param(Any, 'name', true),

    # Corosync applies its configuration immediately. Using a CIB allows
    # you to group multiple primitives and relationships to be applied at
    # once. This can be necessary to insert complex configurations into
    # Corosync correctly.
    # 
    # This paramater sets the CIB this rsc_defaults should be created in. A
    # cs_shadow resource with a title of the same name as this value should
    # also be added to your manifest.
    Puppet::Resource::Param(Any, 'cib'),

    # The specific backend to use for this `cs_rsc_defaults`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # crm
    # : Specific provider for a rather specific type since I currently have no plan to
    #   abstract corosync/pacemaker vs. keepalived. This provider will check the state
    #   of Corosync global defaults for resource options.
    # 
    #   * Required binaries: `cibadmin`, `crm`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
