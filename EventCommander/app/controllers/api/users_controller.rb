# AR Model for user object
class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      @user.gen_auth_token
      render 'api/sessions/create'
    else
      render json: @user.errors.full_messages, status: 401
    end
  end

  def show; end

  def destroy
    user = User.find_by(id: params[:id])
    if user && user.id == current_user.id
      user.destroy
      render json: ["Successfully removed user"]
    else
      render json: ["Failed to find user."]
    end
  end
end
