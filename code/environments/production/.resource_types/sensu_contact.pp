# This file was automatically generated on 2017-10-17 20:40:55 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Manages Sensu contacts
Puppet::Resource::ResourceType3.new(
  'sensu_contact',
  [
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Configuration hash for the contact.
    Puppet::Resource::Param(Any, 'config')
  ],
  [
    # The name of the contact, e.g. "support"
    # 
    # Values can match `/^[\w\.-]+$/`.
    Puppet::Resource::Param(Pattern[/^[\w\.-]+$/], 'name', true),

    # The base path to the contact config file
    Puppet::Resource::Param(Any, 'base_path'),

    # The specific backend to use for this `sensu_contact`
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
