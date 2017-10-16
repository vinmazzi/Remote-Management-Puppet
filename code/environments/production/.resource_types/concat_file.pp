# This file was automatically generated on 2017-09-14 02:10:01 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Gets all the file fragments and puts these into the target file.
# This will mostly be used with exported resources.
# 
# example:
#   Concat_fragment <<| tag == 'unique_tag' |>>
# 
#   concat_file { '/tmp/file':
#     tag            => 'unique_tag', # Mandatory
#     path           => '/tmp/file',  # Optional. If given it overrides the resource name
#     owner          => 'root',       # Optional. Default to undef
#     group          => 'root',       # Optional. Default to undef
#     mode           => '0644'        # Optional. Default to undef
#     order          => 'numeric'     # Optional, Default to 'numeric'
#     ensure_newline => false         # Optional, Defaults to false
#   }
Puppet::Resource::ResourceType3.new(
  'concat_file',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # Tag reference to collect all concat_fragment's with the same tag
    Puppet::Resource::Param(Any, 'tag'),

    # The output file
    Puppet::Resource::Param(Any, 'path', true),

    # Desired file owner.
    Puppet::Resource::Param(Any, 'owner'),

    # Desired file group.
    Puppet::Resource::Param(Any, 'group'),

    # Desired file mode.
    Puppet::Resource::Param(Any, 'mode'),

    # Controls the ordering of fragments. Can be set to alpha or numeric.
    # 
    # Valid values are `alpha`, `numeric`.
    Puppet::Resource::Param(Enum['alpha', 'numeric'], 'order'),

    # Controls the filebucketing behavior of the final file and see File type reference for its use.
    Puppet::Resource::Param(Any, 'backup'),

    # Whether to replace a file that already exists on the local system.
    # 
    # Valid values are `true`, `false`, `yes`, `no`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'yes', 'no']], 'replace'),

    # Validates file.
    Puppet::Resource::Param(Any, 'validate_cmd'),

    # Whether to ensure there is a newline after each fragment.
    # 
    # Valid values are `true`, `false`, `yes`, `no`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'yes', 'no']], 'ensure_newline'),

    Puppet::Resource::Param(Any, 'selinux_ignore_defaults'),

    Puppet::Resource::Param(Any, 'selrange'),

    Puppet::Resource::Param(Any, 'selrole'),

    Puppet::Resource::Param(Any, 'seltype'),

    Puppet::Resource::Param(Any, 'seluser'),

    Puppet::Resource::Param(Any, 'show_diff')
  ],
  {
    /(?m-ix:(.*))/ => ['path']
  },
  true,
  false)
