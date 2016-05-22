require "httparty"
require "net/http"
# require "uri"

module TunesTakeout

  BASE_URL = "https://tunes-takeout-api.herokuapp.com"


  def self.search_results(search_word)
    data = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=#{search_word}").parsed_response["suggestions"]
  end

  def self.top_suggestions(max_number)
    data = HTTParty.get(BASE_URL + "/v1/suggestions/top?limit=#{max_number}").parsed_response["suggestions"]
    data.map!{|suggestion| TunesTakeout.search_suggestions_by(suggestion)}
  end

  def self.search_suggestions_by(id)
    data = HTTParty.get(BASE_URL + "/v1/suggestions/#{id}").parsed_response["suggestion"]
  end

  def self.favorites_by_user_id(user_id)
    data = HTTParty.get(BASE_URL + "/v1/users/#{user_id}/favorites").parsed_response["suggestions"]
    data.map!{|suggestion| TunesTakeout.search_suggestions_by(suggestion)}
  end

  def self.user_suggestion(user_id, suggestion_id)
    uri = URI(BASE_URL + "/v1/users/#{user_id}/favorites")
    response = HTTParty.post(uri, :body => {"suggestion":"#{suggestion_id}"}.to_json,
                                  :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'} )

    if response.response.code == "201"
      "favorite"
    else
      "not saved"
    end
  end

end
