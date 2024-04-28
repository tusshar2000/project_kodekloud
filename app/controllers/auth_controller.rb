class AuthController < ApplicationController
  skip_before_action :authorize_request, only: [:login]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def login 
    @user = User.find_by!(email: login_params[:email])
    if @user.authenticate(login_params[:password])
      @token = JwtTokenService.encode(user_id: @user.id)
      render json: {
        message: 'Login Successful',
        token: @token
      }, status: :accepted
    else
      render json: {message: 'Incorrect password'}, status: :unauthorized
    end
  end

  private 

  def login_params 
    params.permit(:email, :password)
  end

  def handle_record_not_found(e)
    render json: { message: "User doesn't exist" }, status: :unauthorized
  end
end
