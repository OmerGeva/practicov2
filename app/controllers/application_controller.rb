class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 's3cr3t')
  end



  def authenticate_request

    @current_user = AuthorizeApiRequest.call(request.headers).result

    @current_user
  end


  def authorized
    render json: { message: 'Please log in'}, status: :unauthorized unless authenticate_request
  end

end


