# AR Model for team object
class Api::TeamsController < ApplicationController
  def create
    @team = Team.new(team_params)
    if @team.save
      render :show
    else
      render @team.errors.full_messages, status: 401
    end
  end

  def destroy
    @team = selected_team
    if @team
      @team.destroy
      render :show
    else
      render ["Could not find team"], status: 401
    end
  end

  def update
    @team = selected_team
    if @team && @team.user.id == current_user.id
      @team.update_attributes(team_params)
      render :show
    else
      render @team.errors.full_messages, status: 401
    end
  end

  def show
    @team = selected_team
  end

  def index
    @teams = current_user.teams
  end

  private

  def selected_team
    Team.find_by(id: params[:id])
  end

  def team_params
    params.require(:team).permit(:event_id, :name)
  end
end
