YELP_CONSUMER_KEY = "ac7g1t3S2ra7hSKSzUnBJA"
YELP_CONSUMER_SECRET_KEY = "G5SXOND_2_fUW34keN447g5TofA"
YELP_TOKEN_KEY = "0R49YaxmEebNFcNdEimzhyRLg463crzi"
YELP_TOKEN_SECRET = "t84iDFoWTJXcXmT2JQg2naj4x_Y"

Yelp.client.configure do |config|
  config.consumer_key = YELP_CONSUMER_KEY
  config.consumer_secret = YELP_CONSUMER_SECRET_KEY
  config.token = YELP_TOKEN_KEY
  config.token_secret = YELP_TOKEN_SECRET
end
