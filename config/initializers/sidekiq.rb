if Rails.env.production?
  Sidekiq.configure_client do |config|
    config.redis = { url: ENV['REDISTOGO_URL'], size: 4}
  end

  Sidekiq.configure_server do |config|
    config.redis = { url: ENV['REDISTOGO_URL'], size: 4 }
  end
end

