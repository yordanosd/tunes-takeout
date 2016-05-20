require 'httparty'
require 'yelp'
require "erb"


class Food


  def self.yelp_find_by_business(id)
    id = ERB::Util.url_encode(id)
    data = Yelp.client.business(id).business
  end

  # Yelp.client.search(id, parameters)


end
