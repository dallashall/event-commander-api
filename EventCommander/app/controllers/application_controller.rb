class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  def require_login!
    return true if authenticate_token
    render json: { errors: ["Unable to authenticate token."] }, status: 402
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      User.find_by(auth_token: token)
    end
  end

  def authenticate_team_member
    authenticate_with_http_token do |token, _options|
      TeamMember.find_by(auth_token: token)
    end
  end

  def current_team_member
    @current_team_member ||= authenticate_team_member
  end

  def current_user
    @current_user ||= authenticate_token
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
