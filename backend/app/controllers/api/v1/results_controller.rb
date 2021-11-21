module Api
  module V1
    class ResultsController < ApplicationController
      def create
        result = Result.init_instance(result_params)

        if result.save
          render json: { status: 'success' }
        else
          render json: { status: 'error' }
        end
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
