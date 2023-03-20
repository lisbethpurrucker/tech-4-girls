# frozen_string_literal: true

# app/controllers/pages_controller.rb

# Home, profile and ranking page
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home; end

  def profile
    @user = current_user
    @lessons = Lesson.all.where(user_id: @user.id)
  end

  def ranking; end
end
