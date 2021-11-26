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

      private

      def convert_to_store_json(user)
        {
          id: user.id,
          name: user.name,
          email: user.email
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
