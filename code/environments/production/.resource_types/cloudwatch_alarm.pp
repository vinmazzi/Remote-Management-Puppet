# This file was automatically generated on 2017-10-17 20:40:52 -0400.
# Use the 'puppet generate types' command to regenerate this file.

# Type representing an AWS CloudWatch Alarm.
Puppet::Resource::ResourceType3.new(
  'cloudwatch_alarm',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The name of the metric to track.
    Puppet::Resource::Param(Any, 'metric'),

    # The namespace of the metric to track.
    Puppet::Resource::Param(Any, 'namespace'),

    # The statistic to track for the metric.
    Puppet::Resource::Param(Any, 'statistic'),

    # The periodicity of the alarm check.
    Puppet::Resource::Param(Any, 'period'),

    # The number of checks to use to confirm the alarm.
    Puppet::Resource::Param(Any, 'evaluation_periods'),

    # The threshold used to trigger the alarm.
    Puppet::Resource::Param(Any, 'threshold'),

    # The operator to use to test the metric.
    Puppet::Resource::Param(Any, 'comparison_operator'),

    # The region in which to launch the instances.
    Puppet::Resource::Param(Any, 'region'),

    # The dimensions to filter the alarm by.
    Puppet::Resource::Param(Any, 'dimensions'),

    # The actions to trigger when the alarm triggers.
    Puppet::Resource::Param(Any, 'alarm_actions')
  ],
  [
    # The name of the alarm.
    Puppet::Resource::Param(Any, 'name', true),

    # The specific backend to use for this `cloudwatch_alarm`
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
