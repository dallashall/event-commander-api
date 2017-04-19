# AR Model for event object
class Api::EventsController < ApplicationController
  def create
    @event = Event.new(event_params)
    if @event.save
      render :show
    else
      render @event.errors.full_messages, status: 401
    end
  end

  def destroy
    @event = selected_event
    if @event
      @event.destroy
      render :show
    else
      render @event.errors.full_messages, status: 401
    end
  end

  def update
    @event = selected_event
    if @event && @event.user_id == current_user.id
      @event.update_attributes(event_params)
      render :show
    else
      render @event.errors.full_messages, status: 401
    end
  end

  def show
    @event = selected_event
  end

  def index
    @events = current_user.events
  end

  def teams
    @teams = selected_event.teams
    render 'api/teams/index'
  end

  private

  def selected_event
    Event.find_by(id: params[:id])
  end

  def event_params
    params.require(:event).permit(:user_id, :title, :event_date)
  end
end
