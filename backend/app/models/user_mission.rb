class UserMission < ApplicationRecord
  belongs_to :mission
  belongs_to :user

  def self.unregistered_missions(user)
    user_missions = []
    Mission.all.each do |mission|
      user_mission = find_or_initialize_by(user: user, mission: mission)
      if user_mission.created_at.blank?
        user_missions << user_mission
      end
    end
    user_missions
  end
end
