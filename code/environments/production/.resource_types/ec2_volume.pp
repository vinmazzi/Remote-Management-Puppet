# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# type representing an EC2 Block Device
Puppet::Resource::ResourceType3.new(
  'ec2_volume',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # the region in which to launch the volume
    Puppet::Resource::Param(Any, 'region'),

    # the tags for the volume
    Puppet::Resource::Param(Any, 'tags'),

    # a short description of the volume
    Puppet::Resource::Param(Any, 'description'),

    # The availability zone in which to place the instance.
    Puppet::Resource::Param(Any, 'availability_zone'),

    # The size in GB of the volume.
    Puppet::Resource::Param(Any, 'size'),

    # aws id of volume
    Puppet::Resource::Param(Any, 'volume_id'),

    # standard, io1, gp2
    Puppet::Resource::Param(Any, 'volume_type'),

    # The snapshot that this volume should be created from
    Puppet::Resource::Param(Any, 'snapshot_id'),

    # The ec2 instance that this volume should attach to
    Puppet::Resource::Param(Any, 'attach'),

    # Provisioned iops for volume
    Puppet::Resource::Param(Any, 'iops'),

    # The full ARN of the AWS Key Management Service (AWS KMS) customer master key (CMK) to use when creating the encrypted volume.
    Puppet::Resource::Param(Any, 'kms_key_id'),

    # Indicates whether newly created volume should be encrypted.
    Puppet::Resource::Param(Any, 'encrypted')
  ],
  [
    # the name of the security group
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `ec2_volume`
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
