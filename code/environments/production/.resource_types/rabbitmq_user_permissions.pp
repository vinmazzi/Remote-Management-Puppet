# This file was automatically generated on 2017-10-17 20:40:54 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type for managing rabbitmq user permissions
# 
# @example Define some rabbitmq_user_permissions
#  rabbitmq_user_permissions { 'dan@myvhost':
#    configure_permission => '.*',
#    read_permission      => '.*',
#    write_permission     => '.*',
#  }
Puppet::Resource::ResourceType3.new(
  'rabbitmq_user_permissions',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # regexp representing configuration permissions
    Puppet::Resource::Param(Any, 'configure_permission'),

    # regexp representing read permissions
    Puppet::Resource::Param(Any, 'read_permission'),

    # regexp representing write permissions
    Puppet::Resource::Param(Any, 'write_permission')
  ],
  [
    # combination of user@vhost to grant privileges to
    # 
    # Values can match `/^\S+@\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+@\S+$/], 'name', true),

    # The specific backend to use for this `rabbitmq_user_permissions`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # rabbitmqctl
    # : * Required binaries: `rabbitmqctl`.
    #   * Default for `feature` == `posix`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
