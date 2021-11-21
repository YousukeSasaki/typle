module Api
  module V1
    class UsersController < ApplicationController
      def login_create
        User.login_create(user_params)

        render json: { status: 'success' }
      end

      private

      def user_params
        params.require(:user).permit(:name, :sub, :email)
      end
    end
  end
end
