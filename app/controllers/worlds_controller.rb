class WorldsController < ApplicationController
  before_action :set_user

  def index
    @worlds = World.all
  end

  def show
    @world = World.find_by(name: params[:name])
    @lessons = Lesson.where(world_id: @world.id)
  end


  private

  def set_user
    @user = current_user
  end
end
