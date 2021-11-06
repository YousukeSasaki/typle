module Api
  module V1
    class QuestionsController < ApplicationController
      def index
        genre = Genre.where(value: params[:genre])
        questions = Question.where(genre: genre).order('RAND()').limit(100)

        render json: { data: questions.to_json }
      end
    end
  end
end
