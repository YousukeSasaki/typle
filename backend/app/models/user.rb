class User < ApplicationRecord
  has_many :results

  def self.login_create(param)
    sub = param[:sub].split('|')
    user = User.find_or_initialize_by(auth0_social: sub[0], auth0_user_id: sub[1])

    return if user.created_at.present?

    user.name = param[:name]
    user.email = param[:email]
    user.save
  end

  def self.sub_search(sub)
    social, user_id = sub.split('|')
    User.find_by(auth0_social: social, auth0_user_id: user_id)
  end
end
