class Mission < ApplicationRecord
  belongs_to :category, class_name: 'MissionCategory', foreign_key: 'category_id'
  has_many :user_missions
  has_many :users, through: :user_missions
end
