class StatusesController < ApplicationController
  before_action :require_membership!

  def create
    @status = Status.new(status_params)
    if @status.save
      render :show
    else
      render @status.errors.full_messages, status: 401
    end
  end

  def update
    @status = selected_status
    if @status && @status.update_attributes(status_params)
      render :show
    elsif !@status
      render json: ['Could not locate status'], status: 400
    else
      render json: @status.errors.full_messages, status: 401
    end
  end

  def show
    @status = selected_status
  end

  def index
    @statuses = Status.all
  end

  def destroy
    @status = selected_status
    if @status
      @status.destroy
      render :show
    else
      render ['Could not find status']
    end
  end

  private

  def selected_status
    Status.find_by(params[:id])
  end

  def status_params
    params.require(:status).permit(:detail_id, :confirmed)
  end
end
