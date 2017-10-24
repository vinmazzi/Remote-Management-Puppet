# This file was automatically generated on 2017-10-17 20:40:54 -0400.
# Use the 'puppet generate types' command to regenerate this file.

Puppet::Resource::ResourceType3.new(
  'remote_file',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`, `latest`.
    Puppet::Resource::Param(Enum['present', 'absent', 'latest'], 'ensure')
  ],
  [
    # owner attribute of the file. See the File type for details.
    Puppet::Resource::Param(Any, 'owner'),

    # group attribute of the file. See the File type for details.
    Puppet::Resource::Param(Any, 'group'),

    # mode attribute of the file. See the File type for details.
    Puppet::Resource::Param(Any, 'mode'),

    # File path
    Puppet::Resource::Param(Any, 'path', true),

    # Location of the source file.
    Puppet::Resource::Param(Any, 'source'),

    # Checksum of this file. Will not download if local file matches
    Puppet::Resource::Param(Any, 'checksum'),

    # Checksum type to use when verifying file against checksum attribute.
    Puppet::Resource::Param(Any, 'checksum_type'),

    # Whether or not to require verification of the the remote server identity
    Puppet::Resource::Param(Any, 'verify_peer'),

    # Basic authentication username
    Puppet::Resource::Param(Any, 'username'),

    # Basic authentication password
    Puppet::Resource::Param(Any, 'password'),

    # HTTP(S) Proxy URI. Example: http://192.168.12.40:3218
    Puppet::Resource::Param(Any, 'proxy'),

    # HTTP(S) Proxy host. Do not use this if specifying the proxy parameter
    Puppet::Resource::Param(Any, 'proxy_host'),

    # HTTP(S) Proxy port. Do not use this if specifying the proxy parameter
    Puppet::Resource::Param(Any, 'proxy_port'),

    # HTTP(S) Proxy username
    Puppet::Resource::Param(Any, 'proxy_username'),

    # HTTP(S) Proxy password
    Puppet::Resource::Param(Any, 'proxy_password'),

    # HTTP(S) headers. Can be overwriten by others conflicting options
    Puppet::Resource::Param(Any, 'headers'),

    # The specific backend to use for this `remote_file`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # ruby
    # : remote_file using Net::HTTP from Ruby's standard library.
    # 
    #   * Supported features: `lastmodified`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['path']
  },
  true,
  false)
