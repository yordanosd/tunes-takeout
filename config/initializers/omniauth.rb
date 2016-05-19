 # config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"]
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :yelp,:consumer_key => ENV["YELP_CONSUMER_KEY"],:consumer_secret => ENV["YELP_SECRET_KEY"],:token => ENV["TOKEN_KEY"],:token_secret => ENV["TOKEN_SECRET"]
# end
#
# Yelp.client.configure do |config|
#   config.consumer_key = ENV["YELP_CONSUMER_KEY"]
#   config.consumer_secret = ENV["YELP_CONSUMER_SECRET"]
#   config.token = ENV["YELP_TOKEN"]
#   config.token_secret = ENV["YELP_TOKEN_SECRET"]
# end
