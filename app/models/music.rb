require 'httparty'
require 'rspotify'

class Music
  BASE_URL = "https://api.spotify.com"
  ALBUM_PICTURE = "http://marcoscolamedia.com/wp-content/uploads/2015/12/Music-Album-Blank-.jpg"
  attr_reader :item_id, :type, :name, :url, :image_url

  def self.find(type, id)
    result = "RSpotify::#{type}".constantize.find(id)
  end

  def self.user_info
    data = HTTParty.get("https://api.spotify.com/v1/me").parsed_response
  end

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
