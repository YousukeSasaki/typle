class Result < ApplicationRecord
  belongs_to :genre
  belongs_to :play_mode
  belongs_to :user
end
