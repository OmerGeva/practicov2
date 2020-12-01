class CheckInsController < ApplicationController
  def create
    check_in = CheckIn.new(check_in_params)

    if check_in.save!
      render json: {check_in: check_in}
    else
      render json: {error: "Something went wrong."}
    end
  end

    private

  def check_in_params
    params.require(:check_in).permit(:duration, :learnings, :practice_id)
  end
end
