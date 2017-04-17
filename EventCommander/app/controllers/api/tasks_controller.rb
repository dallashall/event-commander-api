class Api::TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    if @task.save
      render :show
    else
      render @task.errors.full_messages, status: 401
    end
  end

  def destroy
    @task = selected_task
    if @task
      @task.destroy
      render :show
    else
      render json: ["Could not find task."], status: 401
    end
  end

  def update
    @task = selected_task
    if @task && @task.update_attributes(task_params)
      render :show
    else
      render json: ["Could not update task"], status: 401
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :order, :event_id)
  end

  def selected_task
    Task.find_by(id: params[:id])
  end
end
