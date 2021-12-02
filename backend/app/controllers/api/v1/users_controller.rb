module Api
  module V1
    class UsersController < ApplicationController
      def update
        user = User.find(params[:id])

        user.assign_attributes(user_update_params)

        user_json = convert_to_store_json(user)

        if user.update(user_update_params)
          render json: { status: 'success', content: '更新が完了しました。', user: user_json }
        else
          render json: { status: 'error', content: '更新ができませんでした。ニックネーム、メールアドレスをご確認ください。' }
        end
      end

      def login_create
        user = User.login_create(user_login_params)

        user_json = convert_to_store_json(user)

        render json: { status: 'success', content: 'ログインしました。', user: user_json }
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
        hours, minutes, secs = hhmmss(results.sum(:play_time_sec))
        normal_corrects = results.sum(:normal_correct)
        bonus_corrects = results.sum(:bonus_correct)
        wrongs = results.sum(:wrong)
        total = normal_corrects + bonus_corrects + wrongs
        accuracy = ((normal_corrects + bonus_corrects).to_f * 100 / total).round(2)
        scores = results.sum(:score)

        {
          counts: counts,
          hours: hours,
          minutes: minutes,
          secs: secs,
          normalCorrects: normal_corrects,
          bonusCorrects: bonus_corrects,
          wrongs: wrongs,
          total: total,
          accuracy: accuracy,
          scores: scores
        }.to_json
      end

      def hhmmss(times)
        times = times.to_i
        hours = times / 3600
        mins = (times - (3600 * hours)) / 60
        secs = times - (3600 * hours) - (60 * mins)

        [hours, mins, secs]
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
