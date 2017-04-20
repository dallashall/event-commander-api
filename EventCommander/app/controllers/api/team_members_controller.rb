class Api::TeamMembersController < ApplicationController
  before_action :require_login!, except: [:connect]

  def create
    @team_member = TeamMember.new(team_member_params)
    if valid_action? && @team_member.save
      render :show
    else
      render @team_member.errors.full_messages, status: 401
    end
  end

  def destroy
    @team_member = selected_team_member
    if valid_action?
      @team_member.destroy
      render :show
    else
      render json: { errors: ["Could not find user"] }, status: 401
    end
  end

  def update
    @team_member = selected_team_member
    if valid_action? && @team_member.update_attributes(team_member_params)
      render :show
    else
      render json: { errors: ["Error updating team member."] }, status: 401
    end
  end

  def connect
    @team_member = TeamMember.find_by(single_use_token: params[:sut])
    if @team_member
      @team_member.gen_auth_token
      render json: { token: @team_member.auth_token }
    else
      render json: { errors: ["Could not validate user"] }, status: 401
    end
  end

  private

  def team_member_params
    params.require(:team_member).permit(:email, :name, :team_id)
  end

  def selected_team_member
    TeamMember.find_by(id: params[:id])
  end

  def valid_action?
    return true if @team_member && @team_member.user.id == current_user.id
    false
  end
end
