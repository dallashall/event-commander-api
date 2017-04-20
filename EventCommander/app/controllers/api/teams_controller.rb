# AR Model for team object
class Api::TeamsController < ApplicationController
  before_action :require_login!
  def create
    @team = Team.new(team_params)
    if valid_action? && @team.save
      render :show
    else
      render @team.errors.full_messages, status: 401
    end
  end

  def destroy
    @team = selected_team
    if valid_action?
      @team.destroy
      render :show
    else
      render ["Could not find team"], status: 401
    end
  end

  def update
    @team = selected_team
    if valid_action? && @team.update_attributes(team_params)
      render :show
    else
      render @team.errors.full_messages, status: 401
    end
  end

  def show
    @team = selected_team
    if valid_action?
      render :show
    else
      render json: { errors: ['Unauthorized access.'] }, status: 401
    end
  end

  def index
    @teams = current_user.teams
  end

  def tasks
    @team = selected_team
    if valid_action?
      @tasks = @team.tasks
      render 'api/teams/index'
    else
      render json: { errors: ['Unauthorized access.'] }, status: 401
    end
  end

  private

  def selected_team
    Team.find_by(id: params[:id])
  end

  def team_params
    params.require(:team).permit(:event_id, :name)
  end

  def valid_action?
    return true if @team && @team.user.id == current_user.id
    false
  end
end
