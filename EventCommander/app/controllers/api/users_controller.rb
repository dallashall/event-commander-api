class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user.username
    else
      render json: @user.errors.full_messages, status: 401
    end
  end
end
