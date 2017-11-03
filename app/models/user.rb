class User < ApplicationRecord

  # def self.from_auth_hash(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.name = auth.info.name
  #     user.oauth_token = auth.info.token
  #     user.oauth_expires_at = auth.info.expires_at
  #     user.save!
  #   end
  # end

  def self.from_auth_hash(auth)
    # user = new
    where(provider: auth['provider'], uid: auth['uid']).first_or_initialize.tap do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.oauth_token = auth['info']['token']
      user.oauth_expires_at = auth['info']['expires_at']
      user.save!
      return user
    end
  end
end
