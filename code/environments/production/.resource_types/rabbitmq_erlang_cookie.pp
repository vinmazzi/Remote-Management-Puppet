# This file was automatically generated on 2017-10-17 20:40:54 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type to manage the rabbitmq erlang cookie securely
# 
# This is essentially a private type used by the rabbitmq::config class
# to manage the erlang cookie. It replaces the rabbitmq_erlang_cookie fact
# from earlier versions of this module. It manages the content of the cookie
# usually located at "${rabbitmq_home}/.erlang.cookie", which includes
# stopping the rabbitmq service and wiping out the database at
# "${rabbitmq_home}/mnesia" if the user agrees to it. We don't recommend using
# this type directly.
Puppet::Resource::ResourceType3.new(
  'rabbitmq_erlang_cookie',
  [
    # Content of cookie
    # 
    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'content')
  ],
  [
    Puppet::Resource::Param(Any, 'path', true),

    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'force'),

    Puppet::Resource::Param(Any, 'rabbitmq_user'),

    Puppet::Resource::Param(Any, 'rabbitmq_group'),

    Puppet::Resource::Param(Any, 'rabbitmq_home'),

    # Values can match `/^\S+$/`.
    Puppet::Resource::Param(Pattern[/^\S+$/], 'service_name'),

    # The specific backend to use for this `rabbitmq_erlang_cookie`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # ruby
    # : * Default for `feature` == `posix`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['path']
  },
  true,
  false)
