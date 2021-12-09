class Result < ApplicationRecord
  belongs_to :genre
  belongs_to :play_mode
  belongs_to :user

  def self.init_instance(params, user:)
    play_mode = PlayMode.find_by(value: params[:play_mode])
    genre = Genre.find_by(value: params[:genre])

    Result.new(
      user: user,
      play_mode: play_mode,
      genre: genre,
      play_time_sec: params[:play_time_sec],
      total: params[:total],
      normal_correct: params[:normal_correct],
      bonus_correct: params[:bonus_correct],
      wrong: params[:wrong],
      accuracy: params[:accuracy],
      score: params[:score]
    )
  end
end
