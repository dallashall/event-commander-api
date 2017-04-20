class Api::DetailAssignmentsController < ApplicationController
  before_action :require_login!

  def create
    @detail_assignment = DetailAssignment.new(detail_assignment_params)
    if valid_action? && @detail_assignment.save
      render :show
    else
      render @detail_assignment.errors.full_messages, status: 401
    end
  end

  def update
    @detail_assignment = selected_detail_assignment
    if valid_action? && @detail_assignment.update(detail_assignment_params)
      render :show
    elsif !@detail_assignment
      render json: ['Could not locate detail_assignment'], status: 400
    else
      render json: @detail_assignment.errors.full_messages, status: 401
    end
  end

  def show
    @detail_assignment = selected_detail_assignment
    if valid_action?
      render :show
    else
      render json: ["Unauthorized access."], status: 401
    end
  end

  def index
    @detail_assignments = DetailAssignment.all
  end

  def destroy
    @detail_assignment = selected_detail_assignment
    if valid_action?
      @detail_assignment.destroy
      render :show
    else
      render ['Could not find detail_assignment']
    end
  end

  private

  def selected_detail_assignment
    DetailAssignment.find_by(id: params[:id])
  end
  
  def detail_assignment_params
    params.require(:detail_assignment).permit(:team_id, :detail_id)
  end

  def valid_action?
    return true if @detail_assignment && @detail_assignment.user.id == current_user.id
    false
  end
end
