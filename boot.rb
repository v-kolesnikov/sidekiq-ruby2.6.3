# frozen_string_literal: true

module My
  require 'logger'
  LOGGER = Logger.new(STDOUT)

  require 'redis'
  require 'redis/connection/hiredis'
  REDIS_URL = ENV.fetch('REDIS_SERVER_URL', 'redis://localhost:6379/4')
  REDIS = Redis.new(
    driver: :hiredis,
    logger: Logger.new(STDOUT),
    url: REDIS_URL
  )

  require 'sidekiq'
  Sidekiq.logger = LOGGER
  require 'connection_pool'
  configuration = lambda do |config|
    config.redis = ConnectionPool.new(size: 5) { REDIS }
  end
  Sidekiq.configure_client(&configuration)
  Sidekiq.configure_server(&configuration)
end
