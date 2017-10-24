# This file was automatically generated on 2017-10-17 20:40:54 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Native type for managing rabbitmq users
# 
# @example query all current users
#  $ puppet resource rabbitmq_user
# 
# @example Configure a user, dan
#  rabbitmq_user { 'dan':
#    admin    => true,
#    password => 'bar',
#  }
# 
# @example Optional parameter tags will set further rabbitmq tags like monitoring, policymaker, etc.
#  To set the administrator tag use admin-flag.
#  rabbitmq_user { 'dan':
#    admin    => true,
#    password => 'bar',
#    tags     => ['monitoring', 'tag1'],
#  }
Puppet::Resource::ResourceType3.new(
  'rabbitmq_user',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # User password to be set *on creation* and validated each run
    Puppet::Resource::Param(Any, 'password'),

    # whether or not user should be an admin
    # 
    # Values can match `/true|false/`.
    Puppet::Resource::Param(Pattern[/true|false/], 'admin'),

    # additional tags for the user
    Puppet::Resource::Param(Any, 'tags')
  ],
  [
    # Name of user
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'name', true),

    # The specific backend to use for this `rabbitmq_user`
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
