# This file was automatically generated on 2017-10-17 20:40:54 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manages Sensu API config
Puppet::Resource::ResourceType3.new(
  'sensu_api_config',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The port that the Sensu API is listening on
    Puppet::Resource::Param(Any, 'port'),

    # The hostname that the Sensu API is listening on
    Puppet::Resource::Param(Any, 'host'),

    # The bind IP that sensu will bind to
    Puppet::Resource::Param(Any, 'bind'),

    # The username used for clients to authenticate against the Sensu API
    Puppet::Resource::Param(Any, 'user'),

    # The password use for client authentication against the Sensu API
    Puppet::Resource::Param(Any, 'password'),

    # Port of the HTTPS (SSL) sensu api service. Enterprise only feature.
    Puppet::Resource::Param(Any, 'ssl_port'),

    # The file path for the SSL certificate keystore. Enterprise only feature.
    Puppet::Resource::Param(Any, 'ssl_keystore_file'),

    # The SSL certificate keystore password. Enterprise only feature.
    Puppet::Resource::Param(Any, 'ssl_keystore_password')
  ],
  [
    # This value has no effect, set it to what ever you want.
    Puppet::Resource::Param(Any, 'name'),

    # The base path to the client config file
    Puppet::Resource::Param(Any, 'base_path'),

    # The specific backend to use for this `sensu_api_config`
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
