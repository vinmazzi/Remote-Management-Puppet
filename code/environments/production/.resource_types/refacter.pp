# This file was automatically generated on 2017-10-17 20:40:54 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Forces puppet to rerun facter to reload and refresh all facts, if any of
# the facts matching the given pattern changed.
# 
# "Before" Example:
# 
#     # this resource sets up a new loopback disk device with
#     # the specified file
#     loopback_dev { "loopback-dev-test-1":
#       path => "/path/to/loopback/dev/files/test-1.bin",
#       size => "10M"
#     }
#     # This class uses facter facts to automatically mount all known
#     # loopback disk devices. However, facter ran *before* the loopback
#     # dev above was created, so it will take an *additional* run of
#     # puppet apply to pick up the change to the system and get that
#     # new device mounted.
#     -> class { "automount::loopbackdisks": pattern => "blkid_dev" }
# 
# "After" Example:
# 
#     loopback_dev { "loopback-dev-test-1":
#       path => "/path/to/loopback/dev/files/test-1.bin",
#       size => "10M"
#     }
#     # after creating the new dev, re-run facter to pick up info about
#     # it so it will be mounted by the below class *during this run.*
#     ~> refacter { "loopback-dev-test-1": }
#     -> class { "automount::loopbackdisks": }
Puppet::Resource::ResourceType3.new(
  'refacter',
  [

  ],
  [
    # An arbitrary name used as the identity of the resource.
    Puppet::Resource::Param(Any, 'name', true),

    # only reload if facts whose names match these patterns changed
    Puppet::Resource::Param(Any, 'patterns'),

    # only reload if facts whose names match this pattern changed
    Puppet::Resource::Param(Any, 'pattern'),

    # only reload if this resource recieves a notification
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'refreshonly'),

    # The specific backend to use for this `refacter`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # ruby
    # : 
    #   This provider handles rerunning facter to reload all the known facts
    #   for the refacter type.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
