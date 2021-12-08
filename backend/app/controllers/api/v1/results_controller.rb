module Api
  module V1
    class ResultsController < ApplicationController
      def create
        ActiveRecord::Base.transaction do
          @result = Result.init_instance(result_params)
          @result.save!

          user = User.find_by_sub(result_params[:user][:sub])
          @exp = Exp.find_by(user: user)
          @exp.gain_exp
        end

        render json: { status: 'success', exp: @exp }
      rescue ActiveRecord::RecordInvalid
        render json: { status: 'error' }
      end

      private

      def result_params
        params.require(:result).permit(
          :play_mode, :genre, :play_time_sec, :total, :normal_correct,
          :bonus_correct, :wrong, :accuracy, :score, user: [:sub]
        )
      end
    end
  end
end
