class MissionCategory < ApplicationRecord
  has_many :missions
  has_ancestry

  def self.roots
    where(ancestry: nil).order(sort_num: :asc)
  end
end
