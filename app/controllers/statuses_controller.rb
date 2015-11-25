class StatusesController < ApplicationController
  def new
    @status = Status.new
  end

  def create
    @status = Status.create(status_params)
    redirect_to owner_cat_path(params[:owner_id], params[:cat_id])
  end

  private

  def status_params
    params.require(:status).permit(:status, :cat_id)
  end
end
