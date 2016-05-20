require 'httparty'
require 'yelp'



class Food


  def self.yelp_find_by_business(id)
    data = Yelp.client.business(id).business
  end

  # Yelp.client.search(id, parameters)


end
