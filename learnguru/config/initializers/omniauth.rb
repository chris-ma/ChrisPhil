
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWITTER_CONSUMER_KEY"], ENV["TWITTER_SECRET_KEY"], :scope => 'offline_access,email'
            
end