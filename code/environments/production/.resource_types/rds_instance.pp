# This file was automatically generated on 2017-10-17 20:40:53 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing an RDS instance.
Puppet::Resource::ResourceType3.new(
  'rds_instance',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The meaning of this parameter differs according to the database engine you use.
    # Type: String
    # 
    # MySQL
    # 
    # The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance.
    # 
    # Constraints:
    # 
    # Must contain 1 to 64 alphanumeric characters
    # Cannot be a word reserved by the specified database engine
    # 
    # PostgreSQL
    # 
    # The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance.
    # 
    # Constraints:
    # 
    # Must contain 1 to 63 alphanumeric characters
    # Must begin with a letter or an underscore. Subsequent characters can be letters, underscores, or digits (0-9).
    # Cannot be a word reserved by the specified database engine
    # 
    # Oracle
    # 
    # The Oracle System ID (SID) of the created DB instance.
    # 
    # Default: ORCL
    # 
    # Constraints:
    # 
    # Cannot be longer than 8 characters
    # 
    # SQL Server
    # 
    # Not applicable. Must be null.
    Puppet::Resource::Param(Any, 'db_name'),

    # The region in which to launch the instance.
    Puppet::Resource::Param(Any, 'region'),

    # The instance class to use for the instance eg. db.m3.medium.
    Puppet::Resource::Param(Any, 'db_instance_class'),

    # The availability zone in which to place the instance.
    Puppet::Resource::Param(Any, 'availability_zone'),

    # the type of Database for the instance( mysql, postgres, etc...)
    Puppet::Resource::Param(Any, 'engine'),

    # The version of Database for the instance.
    Puppet::Resource::Param(Any, 'engine_version'),

    # The size of the DB.
    Puppet::Resource::Param(Any, 'allocated_storage'),

    # The license for the instance (Valid values: license-included | bring-your-own-license | general-public-license).
    Puppet::Resource::Param(Any, 'license_model'),

    # The storage type for the DB (Valid values: gp | io1  *Note: If you specify io1, you must also include a value for the Iops parameter).
    Puppet::Resource::Param(Any, 'storage_type'),

    # The number of input/output operations per second for the database.
    Puppet::Resource::Param(Any, 'iops'),

    # The main user for the DB.
    Puppet::Resource::Param(Any, 'master_username'),

    # Define a multi-az.
    # 
    # Valid values are `false`, `false`, `true`.
    Puppet::Resource::Param(Variant[Boolean, Enum['false', 'true']], 'multi_az'),

    # The VPC DB subnet for this instance.
    Puppet::Resource::Param(Any, 'db_subnet'),

    # The DB security groups to assign to this RDS instance.
    Puppet::Resource::Param(Any, 'db_security_groups'),

    # An array of security group names (or IDs) within the VPC to assign to the instance.
    Puppet::Resource::Param(Any, 'vpc_security_groups'),

    # The connection endpoint for the database.
    Puppet::Resource::Param(Any, 'endpoint'),

    # The port the database is running on.
    Puppet::Resource::Param(Any, 'port'),

    # The DB parameter group for this RDS instance.
    Puppet::Resource::Param(Any, 'db_parameter_group'),

    # The number of days to retain backups. Defaults to 30 days.
    Puppet::Resource::Param(Any, 'backup_retention_period'),

    # The tags for the db instance.
    Puppet::Resource::Param(Any, 'rds_tags')
  ],
  [
    # The name of the db instance (also known as the db_instance_identifier)
    Puppet::Resource::Param(Any, 'name', true),

    # The main user Password.
    Puppet::Resource::Param(Any, 'master_user_password'),

    # Skip snapshot on deletion.
    # 
    # Valid values are `false`, `false`, `true`.
    Puppet::Resource::Param(Variant[Boolean, Enum['false', 'true']], 'skip_final_snapshot'),

    # Name given to the last snapshot on deletion.
    Puppet::Resource::Param(Any, 'final_db_snapshot_identifier'),

    # The database snapshot to restore as this RDS instance.
    Puppet::Resource::Param(Any, 'restore_snapshot'),

    # The specific backend to use for this `rds_instance`
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
