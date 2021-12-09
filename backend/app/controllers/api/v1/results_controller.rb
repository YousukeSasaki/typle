module Api
  module V1
    class ResultsController < ApplicationController
      def create
        ActiveRecord::Base.transaction do
          user = User.find_by_sub(result_params[:user][:sub])

          result = Result.init_instance(result_params, user: user)
          result.save!

          play_log = PlayLog.find_by(user: user)
          play_log.update_log(result_params[:key_types])

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
          :bonus_correct, :wrong, :accuracy, :score, key_types: {}, user: [:sub]
        )
      end
    end
  end
end
