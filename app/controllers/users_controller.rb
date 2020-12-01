class UsersController < ApplicationController
  skip_before_action :authorized, only: [:login, :create]

  # REGISTER
  def create
    # LOOK INTO .VALID AND WHY IT ISN'T NEW AND SAVE
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
  def login
    p params

    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}, status: 401
    end
  end

  # LOG OUT
  def log_out
    render json: {user: nil}
    # TO DO -- ADD OLD TOKEN TO CACHE/DB AND COMPARE OLD TOKENS WHEN TRYING TO AUTHENTICATE
  end


  # def auto_login
  #   render json: @user
  # end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
