class StatusesController < ApplicationController
  def index

  end

  def show
    @status = Status.find(params[:id])
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.create(status_params)
    redirect_to owner_cat_path(params[:owner_id], params[:cat_id])
  end

  def destroy
    Status.destroy(params[:id])
    redirect_to owner_cat_path(params[:owner_id], params[:cat_id])
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.update(params[:id], status_params)
    redirect_to owner_cat_path(params[:owner_id], params[:cat_id])
  end

  private

  def status_params
    params.require(:status).permit(:status, :cat_id)
  end
end
