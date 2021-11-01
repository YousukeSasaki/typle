module Api
  module V1
    class QuestionsController < ApplicationController
      def index
        questions = Question.all

        render json: { data: questions.to_json }
      end
    end
  end
end
