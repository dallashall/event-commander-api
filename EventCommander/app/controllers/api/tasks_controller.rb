# AR Model for task objects
class Api::TasksController < ApplicationController
  before_action :require_login!

  def create
    @task = Task.new(task_params)
    if valid_action? && @task.save
      render :show
    else
      render @task.errors.full_messages, status: 401
    end
  end

  def destroy
    @task = selected_task
    if valid_action?
      @task.destroy
      render :show
    else
      render json: { errors: ["Could not find task."] }, status: 401
    end
  end

  def update
    @task = selected_task
    if valid_action? && @task.update_attributes(task_params)
      render :show
    else
      render json: { errors: ["Could not update task"] }, status: 401
    end
  end

  def show
    @task = selected_task
    if valid_action?
      render :show
    else
      render json: { errors: ['Unauthorized access.'] }, status: 401
    end
  end

  def details
    @task = selected_task
    @details = selected_task.details
    if valid_action?
      render 'api/details/index'
    else
      render json: { errors: ['Unauthorized access.'] }, status: 401
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :order, :event_id, :cue)
  end

  def selected_task
    Task.find_by(id: params[:id])
  end

  def valid_action?
    return true if @task && @task.user.id == current_user.id
    false
  end
end
