# AR Model for detail object
class Api::DetailsController < ApplicationController
  before_action :require_login!

  def create
    @detail = Detail.new(detail_params)
    if @detail.save
      render :show
    else
      render @detail.errors.full_messages, status: 401
    end
  end

  def update
    @detail = selected_detail
    if valid_action? && @detail.update_attributes(detail_params)
      render :show
    elsif !@detail
      render json: ['Could not locate detail'], status: 400
    else
      render json: @detail.errors.full_messages, status: 401
    end
  end

  def show
    @detail = selected_detail
    if valid_action?
      render :show
    else
      render json: ['Unauthorized access'], status: 401
    end
  end

  def index
    @details = Detail.all
  end

  def destroy
    @detail = selected_detail
    if valid_action?
      @detail.destroy
      render :show
    else
      render json: ['Could not find detail'], status: 401
    end
  end

  def assignments
    @detail = selected_detail
    if valid_action?
      @detail_assignments = selected_detail.detail_assignments
      render 'api/detail_assignments/index'
    else
      render json: ["Unauthorized access."], status: 401
    end
  end

  private

  def selected_detail
    Detail.find_by(params[:id])
  end

  def detail_params
    params.require(:detail).permit(:task_id, :text)
  end

  def valid_action?
    return true if @detail && @detail.user.id == current_user.id
    false
  end
end
