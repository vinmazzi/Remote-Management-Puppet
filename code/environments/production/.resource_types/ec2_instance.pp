# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing an EC2 instance.
Puppet::Resource::ResourceType3.new(
  'ec2_instance',
  [
    # Valid values are `present`, `absent`, `running`, `stopped`.
    Puppet::Resource::Param(Enum['present', 'absent', 'running', 'stopped'], 'ensure'),

    # The security groups to associate the instance.
    Puppet::Resource::Param(Any, 'security_groups'),

    # The arn of the amazon IAM role you want the ec2 instance to operate under
    Puppet::Resource::Param(Any, 'iam_instance_profile_arn'),

    # The tags for the instance.
    Puppet::Resource::Param(Any, 'tags'),

    # The name of the key pair associated with this instance.
    Puppet::Resource::Param(Any, 'key_name'),

    # Whether or not monitoring is enabled for this instance.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'monitoring'),

    # The region in which to launch the instance.
    Puppet::Resource::Param(Any, 'region'),

    # The image id to use for the instance.
    Puppet::Resource::Param(Any, 'image_id'),

    # The availability zone in which to place the instance.
    Puppet::Resource::Param(Any, 'availability_zone'),

    # The type to use for the instance.
    Puppet::Resource::Param(Any, 'instance_type'),

    # The instance tenancy: default or dedicated.
    # 
    # Valid values are `default`, `dedicated`.
    Puppet::Resource::Param(Enum['default', 'dedicated'], 'tenancy'),

    # The AWS generated id for the instance.
    Puppet::Resource::Param(Any, 'instance_id'),

    # The type of hypervisor running the instance.
    Puppet::Resource::Param(Any, 'hypervisor'),

    # The underlying virtualization of the instance.
    Puppet::Resource::Param(Any, 'virtualization_type'),

    # The private IP address for the instance.
    Puppet::Resource::Param(Any, 'private_ip_address'),

    # The public IP address for the instance.
    Puppet::Resource::Param(Any, 'public_ip_address'),

    # The internal DNS name for the instance.
    Puppet::Resource::Param(Any, 'private_dns_name'),

    # The publicly available DNS name for the instance.
    Puppet::Resource::Param(Any, 'public_dns_name'),

    # The VPC subnet to attach the instance to.
    Puppet::Resource::Param(Any, 'subnet'),

    # Whether or not to use obtimized storage for the instance.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'ebs_optimized'),

    # The ID of the kernel in use by the instance.
    Puppet::Resource::Param(Any, 'kernel_id'),

    # A list of block devices to associate with the instance
    Puppet::Resource::Param(Any, 'block_devices'),

    # A collected property of the interfaces attached to an instance
    Puppet::Resource::Param(Any, 'interfaces')
  ],
  [
    # The name of the instance.
    Puppet::Resource::Param(Any, 'name', true),

    # The name of the amazon IAM role you want the ec2 instance to operate under
    Puppet::Resource::Param(Any, 'iam_instance_profile_name'),

    # User data script to execute on new instance.
    Puppet::Resource::Param(Any, 'user_data'),

    # Whether to assign a public interface in a VPC.
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'associate_public_ip_address'),

    # Whether the instance stops or terminates when you initiate shutdown from the instance.
    # 
    # Valid values are `stop`, `terminate`.
    Puppet::Resource::Param(Enum['stop', 'terminate'], 'instance_initiated_shutdown_behavior'),

    # The specific backend to use for this `ec2_instance`
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
