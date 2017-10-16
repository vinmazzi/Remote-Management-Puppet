# This file was automatically generated on 2017-09-14 02:10:02 -0400.
# Use the 'puppet generate types' command to regenerate this file.

Puppet::Resource::ResourceType3.new(
  'ini_subsetting',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The value of the subsetting to be defined.
    Puppet::Resource::Param(Any, 'value')
  ],
  [
    # An arbitrary name used as the identity of the resource.
    Puppet::Resource::Param(Any, 'name', true),

    # The name of the section in the ini file in which the setting should be defined.If not provided, defaults to global, top of file, sections.
    Puppet::Resource::Param(Any, 'section'),

    # The name of the setting to be defined.
    Puppet::Resource::Param(Any, 'setting'),

    # The name of the subsetting to be defined.
    Puppet::Resource::Param(Any, 'subsetting'),

    # The separator string between subsettings. Defaults to " "
    Puppet::Resource::Param(Any, 'subsetting_separator'),

    # The separator string between the subsetting name and its value. Defaults to the empty string.
    Puppet::Resource::Param(Any, 'subsetting_key_val_separator'),

    # The ini file Puppet will ensure contains the specified setting.
    Puppet::Resource::Param(Any, 'path'),

    # Whether to display differences when the setting changes.
    # 
    # Valid values are `true`, `md5`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'md5', 'false']], 'show_diff'),

    # The separator string to use between each setting name and value. Defaults to " = ", but you could use this to override e.g. ": ", orwhether or not the separator should include whitespace.
    Puppet::Resource::Param(Any, 'key_val_separator'),

    # The character used to quote the entire value of the setting. Valid values are '', '"' and "'". Defaults to ''.
    Puppet::Resource::Param(Any, 'quote_char'),

    # Set to true if your subsettings don't have values and you want to use exact matches to determine if the subsetting exists. See MODULES-2212
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'use_exact_match'),

    # Where the new subsetting item should be inserted?
    # 
    # * :start  - insert at the beginning of the line.
    # * :end    - insert at the end of the line (default).
    # * :before - insert before the specified element if possible.
    # * :after  - insert after the specified element if possible.
    # * :index  - insert at the specified index number.
    # 
    # Valid values are `start`, `end`, `before`, `after`, `index`.
    Puppet::Resource::Param(Enum['start', 'end', 'before', 'after', 'index'], 'insert_type'),

    # The value for the insert types which require one.
    Puppet::Resource::Param(Any, 'insert_value'),

    # The specific backend to use for this `ini_subsetting`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # ruby
    # :
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
