class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
  end

  def ranking
  end

end
