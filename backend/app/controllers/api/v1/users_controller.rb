module Api
  module V1
    class UsersController < ApplicationController
      def update
        user = User.find(params[:id])

        user.assign_attributes(user_update_params)

        user_json = convert_to_store_json(user)

        if user.update(user_update_params)
          render json: { user: user_json }
        else
          render json: { status: 'error' }
        end
      end

      def login_create
        user = User.login_create(user_login_params)

        user_json = convert_to_store_json(user)

        render json: { user: user_json }
      end

      def dataview
        results = Result.where(user_id: params[:id], created_at: params[:from]..params[:to])

        results_json = convert_to_results_json(results)

        render json: { results: results_json }
      end

      private

      def convert_to_store_json(user)
        {
          id: user.id,
          name: user.name,
          email: user.email
        }.to_json
      end

      def convert_to_results_json(results)
        counts = results.count
        times = results.sum(:play_time_sec).round
        normal_corrects = results.sum(:normal_correct)
        bonus_corrects = results.sum(:bonus_correct)
        wrongs = results.sum(:wrong)
        total = normal_corrects + bonus_corrects + wrongs
        accuracy = ((normal_corrects + bonus_corrects).to_f * 100 / total).round(2)
        scores = results.sum(:score)

        {
          counts: counts,
          times: times,
          normalCorrects: normal_corrects,
          bonusCorrects: bonus_corrects,
          wrongs: wrongs,
          total: total,
          accuracy: accuracy,
          scores: scores
        }.to_json
      end

      def user_update_params
        params.require(:user).permit(:id, :name, :email)
      end

      def user_login_params
        params.require(:user).permit(:name, :sub, :email)
      end
    end
  end
end
