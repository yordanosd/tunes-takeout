require 'httparty'
require 'rspotify'

class Music
  BASE_URL = "https://api.spotify.com"
  ALBUM_PICTURE = "http://marcoscolamedia.com/wp-content/uploads/2015/12/Music-Album-Blank-.jpg"
  attr_reader :item_id, :type, :name, :url, :image_url

  # def initialize(data)
  #   @item_id = data["item_id"]
  #   @type = data["moves"]
  #   @name = data["name"]
  #   @url = data["url"]
  #   @image_url = data["image_url"]
  #
  # end

  # def self.find(id)
  #   data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=banana").parsed_response
  #   self.new(data)
  # end

  def self.find(type, id)
    result = "RSpotify::#{type}".constantize.find(id)
  end

  # def self.find(type, id)
  #   data = HTTParty.get(BASE_URL + "/v1/#{type}/#{id}").parsed_response
  #   artists = RSpotify::Artist.search('Arctic Monkeys')
  #   result = "RSpotify/#{type}".camelize.search(id)
  #
  #   album = RSpotify::Album.search(id)
  #
  # end
  def self.picture?(image)
    if image.nil?
      return ALBUM_PICTURE
    elsif image[0].nil?
      return ALBUM_PICTURE
    else
      image[0]["url"]
    end
  end


  private

end
