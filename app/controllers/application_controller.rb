class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authorize_request

  rescue_from CanCan::AccessDenied do
    render json: { error: 'Unauthorized to do this task' }, status: :unauthorized
  end

  private

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    begin
      decoded_token = JwtTokenService.decode(token)
      @current_user = User.find(decoded_token['user_id']) if decoded_token
    rescue => e
      Rails.logger.error("Authorization error message: #{e}")
      return render json: { error: 'Invalid token' }, status: :unauthorized
    end

    unless @current_user
      return render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end
