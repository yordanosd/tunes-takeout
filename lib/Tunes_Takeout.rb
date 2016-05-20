require "httparty"

module TunesTakeout

  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"


  def self.search_results(search_word)
    data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=#{search_word}").parsed_response
  end

  def self.top_suggestions(max_number)
    data = HTTParty.get(BASE_URL + "/v1/suggestions/top?limit=#{max_number}").parsed_response["suggestions"]
    data.map!{|suggestions| TunesTakeout.search_suggestions_by(suggestions)}
  end

  def self.search_suggestions_by(id)
    data = HTTParty.get(BASE_URL + "/v1/suggestions/#{id}").parsed_response["suggestion"]
  end

  def self.favorites_by_user_id(user_id)
    data = HTTParty.get(BASE_URL + "/v1/users/#{user_id}/favorites").parsed_response
  end

  def self.user_suggestion(suggestion)
    uri = URI(BASE_URL + "/v1/users/#{suggestion}/favorites")
    res = Net::HTTP.post_form(uri, "suggestion" => suggestion)
    puts res.body
    data = HTTParty.post(BASE_URL + "/v1/users/#{user_id}/favorites").parsed_response
  end

end
