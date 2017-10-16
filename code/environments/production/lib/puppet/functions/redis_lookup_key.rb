Puppet::Functions.create_function(:redis_lookup_key) do

  require 'redis'

  dispatch :redis_lookup_key do
    param 'String[1]', :key
    param 'Hash[String[1],Any]', :options
    param 'Puppet::LookupContext', :context
  end

  def redis_lookup_key(key, options, context)
#    return context.cached_value(key) if context.cache_has_key(key)

    # nil key is used to indicate that the cache contains the raw content of the eyaml file
   # raw_data = context.cached_value(nil)
   # if raw_data.nil?
    raw_data = load_data_hash(key, options)
    context.cache(nil, raw_data)
   # end
    #context.not_found if raw_data = nil
    context.cache(key, raw_data)
  end

  def load_data_hash(key, options)
    path = options['search']
    host = options['host']
    port = options['port']

    redis = Redis.new(:host => host)
    data = redis.get("#{path}:#{key}")
    puts data
    data
  end
end
