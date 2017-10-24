# This file was automatically generated on 2017-10-17 20:40:55 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manages Sensu Enterprise Dashboard API config
Puppet::Resource::ResourceType3.new(
  'sensu_enterprise_dashboard_api_config',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The name of the Sensu API (used elsewhere as the datacenter name).
    Puppet::Resource::Param(Any, 'datacenter'),

    # The port of the Sensu API.
    # 
    # Values can match `/[0-9]+/`.
    Puppet::Resource::Param(Pattern[/[0-9]+/], 'port'),

    # Determines whether or not to use the HTTPS protocol.
    Puppet::Resource::Param(Any, 'ssl'),

    # Determines whether or not to accept an insecure SSL certificate.
    Puppet::Resource::Param(Any, 'insecure'),

    # The path of the Sensu API. Leave empty unless your Sensu API is not mounted to /.
    Puppet::Resource::Param(Any, 'path'),

    # The timeout for the Sensu API, in seconds.
    # 
    # Values can match `/[0-9]+/`.
    Puppet::Resource::Param(Pattern[/[0-9]+/], 'timeout'),

    # The username of the Sensu API. Leave empty for no authentication.
    # 
    # Values can match `/.+/`.
    Puppet::Resource::Param(Pattern[/.+/], 'user'),

    # The password of the Sensu API. Leave empty for no authentication.
    # 
    # Values can match `/.+/`.
    Puppet::Resource::Param(Pattern[/.+/], 'pass')
  ],
  [
    # The hostname or IP address of the Sensu API.
    Puppet::Resource::Param(Any, 'host', true),

    # The base path to the client config file
    Puppet::Resource::Param(Any, 'base_path'),

    # The specific backend to use for this `sensu_enterprise_dashboard_api_config`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # json
    # :
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['host']
  },
  true,
  false)
