# API methods for session
class Api::SessionsController < ApplicationController
  before_action :require_login!, except: [:create]

  def create
    @user = User.find_by(email: user_params[:email])
    if user && user.is_password?(user_params[:password])
      @auth_token = user.gen_auth_token
      render :create
    else
      invalid_login
    end
  end

  def destroy
    user = current_user
    user.invalidate_token
    head :ok
  end

  private

  def invalid_login
    render json: { errors: ["Error with login credentials."] }, status: 401
  end
end
