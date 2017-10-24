# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing an EC2 launch configuration.
Puppet::Resource::ResourceType3.new(
  'ec2_launchconfiguration',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The security groups to associate with the instances.
    Puppet::Resource::Param(Any, 'security_groups'),

    # The name of the key pair associated with this instance.
    Puppet::Resource::Param(Any, 'key_name'),

    # The region in which to launch the instances.
    Puppet::Resource::Param(Any, 'region'),

    # The type to use for the instances.
    Puppet::Resource::Param(Any, 'instance_type'),

    # The image id to use for the instances.
    Puppet::Resource::Param(Any, 'image_id'),

    # One or more mappings that specify how block devices are exposed to the instance.
    Puppet::Resource::Param(Any, 'block_device_mappings')
  ],
  [
    # The name of the launch configuration.
    Puppet::Resource::Param(Any, 'name', true),

    # User data script to execute on new instances.
    Puppet::Resource::Param(Any, 'user_data'),

    # A hint to specify the VPC, useful when detecting ambiguously named security groups like default.
    Puppet::Resource::Param(Any, 'vpc'),

    # The specific backend to use for this `ec2_launchconfiguration`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # v2
    # :
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
