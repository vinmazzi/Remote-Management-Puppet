# This file was automatically generated on 2017-09-14 02:10:02 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# This type is an implementation detail. DO NOT use it directly
Puppet::Resource::ResourceType3.new(
  'cs_commit',
  [

  ],
  [
    Puppet::Resource::Param(Any, 'cib'),

    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `cs_commit`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # crm
    # : * Required binaries: `cibadmin`, `crm_shadow`, `crm`.
    #   * Supported features: `refreshable`.
    # 
    # pcs
    # : * Required binaries: `cibadmin`, `crm_shadow`, `pcs`.
    #   * Supported features: `refreshable`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
