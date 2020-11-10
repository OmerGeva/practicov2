class PracticesController < ApplicationController
  def index
    practices = @current_user.practices

    render json: {practices: practices}
  end

  def create

  end
end
