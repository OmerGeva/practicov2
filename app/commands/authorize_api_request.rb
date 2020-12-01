class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    logged_in_user
  end

  private

  attr_reader :headers

  def decoded_token
    # not complete
    previous_keys = $redis.keys
    is_old_key = previous_keys.find { |key| key == headers['Authorization'] }
    p headers
    p headers['Authorization'][7..-1]
    if is_old_key
      nil
    elsif headers
      token = headers['Authorization'][7..-1]
      begin
        JWT.decode(token, 's3cr3t', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      p User.find(user_id)
      @user = User.find(user_id)
    end

    @user
  end


end
