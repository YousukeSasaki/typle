module Api
  module V1
    class UsersController < ApplicationController
      def login_create
        User.login_create(params[:user])

        render json: { status: 'success' }
      end
    end
  end
end
