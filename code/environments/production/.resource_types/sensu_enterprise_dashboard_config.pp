# This file was automatically generated on 2017-10-17 20:40:55 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manages Sensu Enterprise Dashboard config
Puppet::Resource::ResourceType3.new(
  'sensu_enterprise_dashboard_config',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The hostname or IP address on which Sensu Enterprise Dashboard will listen on.
    Puppet::Resource::Param(Any, 'host'),

    # The port on which Sensu Enterprise Dashboard will listen on.
    Puppet::Resource::Param(Any, 'port'),

    # Determines the interval to poll the Sensu APIs, in seconds.
    Puppet::Resource::Param(Any, 'refresh'),

    # A username to enable simple authentication and restrict access to the dashboard. Leave blank along with pass to disable simple authentication.
    Puppet::Resource::Param(Any, 'user'),

    # A password to enable simple authentication and restrict access to the dashboard. Leave blank along with user to disable simple authentication.
    Puppet::Resource::Param(Any, 'pass'),

    # A hash of SSL attributes to enable native SSL
    Puppet::Resource::Param(Any, 'ssl'),

    # A hash of audit attributes to enable audit logging
    Puppet::Resource::Param(Any, 'audit'),

    # A hash of GitHub authentication attributes to enable GitHub authentication via OAuth. Overrides simple authentication.
    Puppet::Resource::Param(Any, 'github'),

    # A hash of GitLab authentication attributes to enable GitLab authentication via OAuth. Overrides simple authentication.
    Puppet::Resource::Param(Any, 'gitlab'),

    # A hash of Lightweight Directory Access Protocol (LDAP) authentication attributes to enable LDAP authentication. Overrides simple authentication.
    Puppet::Resource::Param(Any, 'ldap')
  ],
  [
    # This value has no effect, set it to what ever you want.
    Puppet::Resource::Param(Any, 'name'),

    # The base path to the client config file
    Puppet::Resource::Param(Any, 'base_path'),

    # The specific backend to use for this `sensu_enterprise_dashboard_config`
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
