# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type for the RDS DB subnet group which relies on the existence of corresponding ec2_subnets. Subnets are required to be in seperate AZs
Puppet::Resource::ResourceType3.new(
  'rds_db_subnet_group',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # a short description of the RDS DB subnet group (db_subnet_group_description)
    Puppet::Resource::Param(Any, 'description'),

    # The region to deploy the RDS DB Subnet group, should be same region as associated rds_instance
    Puppet::Resource::Param(Any, 'region'),

    # VPC to deploy the RDS DB Subnet group, should be same as VPC associated to rds_instance .
    Puppet::Resource::Param(Any, 'vpc'),

    # The subnets in which to launch the RDS DB Subnet Group. DB subnet groups must contain at least one subnet in at least two AZs in the region.
    Puppet::Resource::Param(Any, 'subnets')
  ],
  [
    # The name of the RDS DB subnet group (db_subnet_group_name.)
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `rds_db_subnet_group`
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
