require 'test_helper'

# class UserTest < ActiveSupport::TestCase
#   # test "the truth" do
#   #   assert true
#   # end
# end


describe User do
  it "user has 'Spotify' as an API provider" do
    assert_equal "Spotify", User.find(1).provider
  end
end
