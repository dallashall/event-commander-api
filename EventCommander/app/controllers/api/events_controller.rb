# AR Model for event object
class Api::EventsController < ApplicationController
  before_action :require_login!

  def create
    @event = Event.new(event_params)
    if valid_action? && @event.save
      render :show
    else
      render @event.errors.full_messages, status: 401
    end
  end

  def destroy
    @event = selected_event
    if valid_action?
      @event.destroy
      render :show
    else
      render @event.errors.full_messages, status: 401
    end
  end

  def update
    @event = selected_event
    if valid_action? && @event.update_attributes(event_params)
      render :show
    else
      render @event.errors.full_messages, status: 401
    end
  end

  def show
    @event = selected_event
    if valid_action?
      render :show
    else
      render json: { errors: ["Unauthorized access."] }, status: 401
    end
  end

  def index
    @events = current_user.events
  end

  def teams
    @event = selected_event
    if valid_action?
      @teams = selected_event.teams
      render 'api/teams/index'
    else
      render json: { errors: ["Unauthorized access."] }, status: 401
    end
  end

  def activate
    @event = selected_event
    @event.create_statuses
    @event.send_invites
  end

  private

  def selected_event
    Event.find_by(id: params[:id])
  end

  def event_params
    params.require(:event).permit(:user_id, :title, :event_date)
  end

  def valid_action?
    return true if @event && @event.user.id == current_user.id
    false
  end
end
