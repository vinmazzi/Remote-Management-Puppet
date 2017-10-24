# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing an RDS instance.
Puppet::Resource::ResourceType3.new(
  'rds_db_securitygroup',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The description of a DB Security group.
    Puppet::Resource::Param(Any, 'description'),

    # The ID of the owner of this DB Security Group.
    Puppet::Resource::Param(Any, 'owner_id'),

    # The EC2 Security Groups assigned to this RDS DB security group.
    Puppet::Resource::Param(Any, 'security_groups'),

    # The region in which to create the db_securitygroup.
    Puppet::Resource::Param(Any, 'region'),

    # The IP ranges allowed to access the RDS instance.
    Puppet::Resource::Param(Any, 'ip_ranges')
  ],
  [
    # The name of the DB Security Group (also known as the db_security_group_name).
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `rds_db_securitygroup`
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
