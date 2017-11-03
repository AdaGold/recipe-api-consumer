class User < ApplicationRecord
  # def self.from_auth_hash(provider, auth_hash)
  #   user = new
  #   user.provider = provider
  #   user.uid = auth_hash['uid']
  #   user.name = auth_hash['info']['name']
  #   user.name = auth_hash['info']['name']
  #   user.oauth_token = auth_hash['info']['oauth_token']
  #   user.oauth_expires_at = auth_hash['info']['oauth_expires_at']
  #   return user
  # end

  def self.from_auth_hash(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.info.token
      user.oauth_expires_at = auth.info.expires_at
      user.save!
    end
  end
end
