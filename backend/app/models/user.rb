class User < ApplicationRecord
  has_many :results
  has_one :exp

  def self.login_create(param)
    sub = param[:sub].split('|')
    user = User.find_or_initialize_by(auth0_social: sub[0], auth0_user_id: sub[1])

    if user.created_at.blank?
      ActiveRecord::Base.transaction do
        exp = Exp.new(user: user, level: 1, point: 0, max_point: 1)
        exp.save!

        user.name = param[:name]
        user.email = param[:email]
        user.save!
      end
    end

    user
  end

  def self.find_by_sub(sub)
    social, user_id = sub.split('|')
    User.find_by(auth0_social: social, auth0_user_id: user_id)
  end
end
