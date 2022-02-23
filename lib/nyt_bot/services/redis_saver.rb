require 'redis'

class RedisSaver
  def self.call(redis_key, redis_value)
    Redis.current.set(redis_key, redis_value) 
  end
end
