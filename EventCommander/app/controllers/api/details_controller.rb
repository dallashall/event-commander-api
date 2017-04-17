# AR Model for detail object
class Api::DetailsController < ApplicationController
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
    if @detail && @detail.update_attributes(detail_params)
      render :show
    elsif !@detail
      render json: ['Could not locate detail'], status: 400
    else
      render json: @detail.errors.full_messages, status: 401
    end
  end

  def show
    @detail = selected_detail
  end

  def index
    @details = Detail.all
  end

  def destroy
    @detail = selected_detail
    if @detail
      @detail.destroy
      render :show
    else
      render ['Could not find detail']
    end
  end

  private

  def selected_detail
    Detail.find_by(params[:id])
  end

  def detail_params
    params.require(:detail).permit(:task_id, :text)
  end
end
