class PlayLog < ApplicationRecord
  belongs_to :user

  def update_log(key_types)
    key_types.each do |key, value|
      column = "key_count_#{key}".to_sym
      self[column] += value
    end

    save!
  end
end
