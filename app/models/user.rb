require 'httparty'

class User < ActiveRecord::Base

  validates :uid, :provider, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
    # find or create a user
    user = User.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
    if user
      return user
    else
      # no user found
      user = User.new
      user.uid = auth_hash["uid"]
      user.provider = auth_hash["provider"]
      if user.save
        return user
      else
        return nil
      end
    end
  end
end
