class User < ApplicationRecord
  has_many :results
  has_many :user_missions
  has_many :missions, through: :user_missions
  has_one :exp
  has_one :play_log

  def self.login_create(param)
    sub = param[:sub].split('|')
    user = User.find_or_initialize_by(auth0_social: sub[0], auth0_user_id: sub[1])

    if user.created_at.blank?
      ActiveRecord::Base.transaction do
        exp = Exp.new(user: user)
        exp.save!

        play_log = PlayLog.new(user: user)
        play_log.save!

        # TODO: パフォーマンス改善
        user_missions = UserMission.unregistered_missions(user)
        user_missions.each(&:save!)

        # TODO: メールアドレス登録の場合、nameはメールアドレスが入っているため、登録後すぐにアカウント名登録ダイアログを出したい
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
