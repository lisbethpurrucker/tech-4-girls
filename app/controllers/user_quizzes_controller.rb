class UserQuizzesController < ApplicationController
  before_action :set_user

  def show
    @user_quiz = UserQuiz.find_by(user_id: @user.id, quiz_id: params[:quiz])

    if @user_quiz.nil?
      @user_quiz = UserQuiz.create!(user_id: @user.id, quiz_id: params[:quiz], status: 1, progress: 0.0)
    end
  end

  private

  def set_user
    @user = current_user
  end
end
