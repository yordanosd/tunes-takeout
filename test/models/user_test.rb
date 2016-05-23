require 'test_helper'


BASE_URL = "https://tunes-takeout-api.herokuapp.com"


describe User do
  it "user has 'Spotify' as an API provider" do
    assert_equal "Spotify", User.find(1)
  end

  it "uses v1 of the API" do
    assert_equal "https://tunes-takeout-api.herokuapp.com", TunesTakeout::BASE_URL
  end

end

describe TunesTakeout do
  it "returns top twenty suggestions", :vcr do
    assert_equal 20, TunesTakeout.top_suggestions(20).count
  end

  it "returns a valid RSpotify music_id and music_type", :vcr do
    music = TunesTakeout.top_suggestions(20)
    music.map!{|suggestion| Music.find(suggestion["music_type"].capitalize, suggestion["music_id"]).class.parent}
    assert_equal RSpotify, music.uniq[0]
  end

  it "returns a valid Yelp food_id", :vcr do
    food = TunesTakeout.top_suggestions(20)
    food.map!{|suggestion| Food.yelp_find_by_business(suggestion["food_id"]).class.parent.parent.parent}
    assert_equal Yelp, food.uniq[0]
  end



end
