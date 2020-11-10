class UsersController < ApplicationController
  skip_before_action :authorized, only: [:login]

  # REGISTER
  def create
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
    @user = User.find_by(username: params[:username])
    p params
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
  end


  def auto_login
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
