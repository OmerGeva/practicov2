class PracticesController < ApplicationController
  def index
    practices = @current_user.practices

    render json: {practices: practices}
  end

  def create
    practice = Practice.new(practice_params)
    practice.user = @current_user
    if practice.save!
      render json: {practice: practice}
    else
      render json: {error: "Something went wrong."}
    end

  end

  private

  def practice_params
    params.require(:practice).permit(:title, :start_date, :goal, :time_type, :skill_id)
  end
end
