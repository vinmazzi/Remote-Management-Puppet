# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing a CloudFormation stack.
# 
# Example:
# 
# cloudformation_stack { 's3-bucket-test':
#   ensure        => updated,
#   region        => 'us-west-2',
#   template_url  => 'https://s3-us-west-2.amazonaws.com/cloudformation-templates-us-west-2/S3_Website_Bucket_With_Retain_On_Delete.template',
# }
Puppet::Resource::ResourceType3.new(
  'cloudformation_stack',
  [
    # The ensure value for the stack.
    # "present" will create the stack but not apply updates.
    # "updated" will create or apply any updates to the stack.
    # "absent" will delete the stack.
    # 
    # Valid values are `present`, `updated`, `absent`.
    Puppet::Resource::Param(Enum['present', 'updated', 'absent'], 'ensure'),

    # The list of stack capabilities, including CAPABILITY_IAM, CAPABILITY_NAMED_IAM, an empty list, or unspecified.
    Puppet::Resource::Param(Any, 'capabilities'),

    # Unique identifier of the stack. (readonly)
    Puppet::Resource::Param(Any, 'change_set_id'),

    # The time at which the stack was created. (readonly)
    Puppet::Resource::Param(Any, 'creation_time'),

    # A user-defined description associated with the stack. (readonly)
    Puppet::Resource::Param(Any, 'description'),

    # The unique ID of the stack. (readonly)
    Puppet::Resource::Param(Any, 'id'),

    # The time the stack was last updated. (readonly)
    Puppet::Resource::Param(Any, 'last_updated_time'),

    # List of SNS topic ARNs to which stack related events are published.
    Puppet::Resource::Param(Any, 'notification_arns'),

    # Determines what action will be taken if stack creation fails. This must be one of: "DO_NOTHING", "ROLLBACK", or "DELETE". You can specify either on_failure or disable_rollback, but not both.
    # 
    # Valid values are `DO_NOTHING`, `ROLLBACK`, `DELETE`.
    Puppet::Resource::Param(Enum['DO_NOTHING', 'ROLLBACK', 'DELETE'], 'on_failure'),

    # A hash of stack outputs. (readonly)
    Puppet::Resource::Param(Any, 'outputs'),

    # A hash of input parameters.
    Puppet::Resource::Param(Any, 'parameters'),

    # The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that is associated with the stack.
    Puppet::Resource::Param(Any, 'role_arn'),

    # The status of the stack. (readonly)
    # 
    # Valid values are `CREATE_IN_PROGRESS`, `CREATE_FAILED`, `CREATE_COMPLETE`, `ROLLBACK_IN_PROGRESS`, `ROLLBACK_FAILED`, `ROLLBACK_COMPLETE`, `DELETE_IN_PROGRESS`, `DELETE_FAILED`, `DELETE_COMPLETE`, `UPDATE_IN_PROGRESS`, `UPDATE_COMPLETE_CLEANUP_IN_PROGRESS`, `UPDATE_COMPLETE`, `UPDATE_ROLLBACK_IN_PROGRESS`, `UPDATE_ROLLBACK_FAILED`, `UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS`, `UPDATE_ROLLBACK_COMPLETE`, `REVIEW_IN_PROGRESS`.
    Puppet::Resource::Param(Enum['CREATE_IN_PROGRESS', 'CREATE_FAILED', 'CREATE_COMPLETE', 'ROLLBACK_IN_PROGRESS', 'ROLLBACK_FAILED', 'ROLLBACK_COMPLETE', 'DELETE_IN_PROGRESS', 'DELETE_FAILED', 'DELETE_COMPLETE', 'UPDATE_IN_PROGRESS', 'UPDATE_COMPLETE_CLEANUP_IN_PROGRESS', 'UPDATE_COMPLETE', 'UPDATE_ROLLBACK_IN_PROGRESS', 'UPDATE_ROLLBACK_FAILED', 'UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS', 'UPDATE_ROLLBACK_COMPLETE', 'REVIEW_IN_PROGRESS'], 'status'),

    # The amount of time within which stack creation should complete.
    Puppet::Resource::Param(Any, 'timeout_in_minutes'),

    # The tags for the instance.
    Puppet::Resource::Param(Any, 'tags'),

    # The region in which to launch the stack.
    Puppet::Resource::Param(Any, 'region')
  ],
  [
    # The name of the stack.
    Puppet::Resource::Param(Any, 'name', true),

    # Whether to disable rollback on stack creation failures. (boolean)
    # 
    # Valid values are `true`, `false`, `yes`, `no`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'yes', 'no']], 'disable_rollback'),

    # JSON structure containing the stack policy body. For more information, go to Prevent Updates to Stack Resources in the AWS CloudFormation User Guide. You can specify either the policy_body or the policy_url parameter, but not both.
    Puppet::Resource::Param(Any, 'policy_body'),

    # Location of a file containing the stack policy. The URL must point to a policy (maximum size: 16 KB) located in an S3 bucket in the same region as the stack. You can specify either the policy_body or the policy_url parameter, but not both.
    Puppet::Resource::Param(Any, 'policy_url'),

    # The list of resource types that you have permissions to work with for this stack. (optional)
    Puppet::Resource::Param(Any, 'resource_types'),

    # Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes. For more information, go to Template Anatomy in the AWS CloudFormation User Guide.
    Puppet::Resource::Param(Any, 'template_body'),

    # Location of file containing the template body. The URL must point to a template (max size: 460,800 bytes) that is located in an Amazon S3 bucket. For more information, go to the Template Anatomy in the AWS CloudFormation User Guide.
    Puppet::Resource::Param(Any, 'template_url'),

    # The specific backend to use for this `cloudformation_stack`
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
