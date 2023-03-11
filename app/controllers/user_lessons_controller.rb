class UserLessonsController < ApplicationController
  before_action :set_user

  def index
  end

  def show
    @lesson = Lesson.find(params[:lesson])
    @user_lesson = UserLesson.find_by(lesson_id: @lesson.id, user_id: @user.id)
    @quiz = Quiz.find_by(lesson_id: @lesson.id)

    if @user_lesson.nil?
      @user_lesson = UserLesson.create!(lesson_id: @lesson.id, user_id: @current_user.id, progress: 0.0, status: 1)
    end
  end

  private

  def set_user
    @user = current_user
  end
end
