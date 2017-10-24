# This file was automatically generated on 2017-10-17 20:40:55 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manages Sensu checks
Puppet::Resource::ResourceType3.new(
  'sensu_check',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Command to be run by the check
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'command'),

    # Dependencies of this check
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'dependencies'),

    # List of handlers that responds to this check
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'handlers'),

    # Contact names to override handler configuration via Contact Routing
    # 
    # Valid values are `absent`. Values can match `/^[\w\.-]+$/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/^[\w\.-]+$/]], 'contacts'),

    # A host is determined to be flapping when the percent change exceedes this threshold.
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'high_flap_threshold'),

    # When the check should be executed, using the Cron syntax.
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'cron'),

    # How frequently the check runs in seconds
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'interval'),

    # The number of event occurrences before the handler should take action.
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'occurrences'),

    # The number of seconds sensu-plugin-aware handlers should wait before taking second action.
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'refresh'),

    # A host is determined to be flapping when the percent change is below this threshold.
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'low_flap_threshold'),

    # The check source, used to create a JIT Sensu client for an external resource (e.g. a network switch).
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'source'),

    # Who is subscribed to this check
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'subscribers'),

    # Custom check variables
    Puppet::Resource::Param(Any, 'custom'),

    # What type of check is this
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'type'),

    # Whether this is a standalone check
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'standalone'),

    # Check timeout in seconds, after it fails
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'timeout'),

    # Whether check is aggregate
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'aggregate'),

    # An array of aggregates to add to the check
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'aggregates'),

    # Whether check event send to a handler
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'handle'),

    # Whether check is unpublished
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'publish'),

    # Check subdue
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'subdue'),

    # Proxy Requests
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'proxy_requests'),

    # Check ttl in seconds
    # 
    # Valid values are `absent`. Values can match `/.*/`.
    Puppet::Resource::Param(Variant[Enum['absent'], Pattern[/.*/]], 'ttl')
  ],
  [
    # The name of the check.
    Puppet::Resource::Param(Any, 'name'),

    # The base path to the client config file
    Puppet::Resource::Param(Any, 'base_path'),

    # The specific backend to use for this `sensu_check`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # json
    # :
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
