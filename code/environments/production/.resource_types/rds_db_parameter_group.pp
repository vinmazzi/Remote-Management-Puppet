# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing an RDS DB Parameter group.
Puppet::Resource::ResourceType3.new(
  'rds_db_parameter_group',
  [
    # The description of a DB parameter group.
    Puppet::Resource::Param(Any, 'description'),

    # The name of the DB family that this DB parameter group is compatible with (eg. mysql5.1).
    Puppet::Resource::Param(Any, 'family'),

    # The region in which to create the db_parameter_group.
    Puppet::Resource::Param(Any, 'region')
  ],
  [
    # The name of the DB Parameter Group (also known as the db_parameter_group_name).
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `rds_db_parameter_group`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # v2
    # :
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
