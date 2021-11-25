module Api
  module V1
    class UsersController < ApplicationController
      def login_create
        user = User.login_create(user_params)

        user_obj = {
          id: user.id,
          name: user.name,
          email: user.email
        }.to_json

        render json: { user: user_obj }
      end

      private

      def user_params
        params.require(:user).permit(:name, :sub, :email)
      end
    end
  end
end
