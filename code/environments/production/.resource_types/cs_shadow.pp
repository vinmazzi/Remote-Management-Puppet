# This file was automatically generated on 2017-09-14 02:10:02 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# cs_shadow resources represent a Corosync shadow CIB. Any corosync
# resources defined with 'cib' set to the title of a cs_shadow resource
# will not become active until all other resources with the same cib
# value have also been applied.
Puppet::Resource::ResourceType3.new(
  'cs_shadow',
  [
    Puppet::Resource::Param(Any, 'epoch')
  ],
  [
    Puppet::Resource::Param(Any, 'cib', true),

    # Whether to generate a cs_commit or not. Can be used to create shadow
    # CIB without committing them.
    # 
    # Valid values are `true`, `false`, `yes`, `no`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'yes', 'no']], 'autocommit'),

    # The specific backend to use for this `cs_shadow`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # crm
    # : * Required binaries: `cibadmin`, `crm_shadow`, `crm`.
    # 
    # pcs
    # : * Required binaries: `cibadmin`, `crm_shadow`, `pcs`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['cib']
  },
  true,
  false)
