class OwnersController < ApplicationController
  def index

  end

  def show
    @owner = Owner.find(params[:id])
  end

  def new
    @owner = Owner.new
  end

  def create
    owner = Owner.create(owner_params)
    redirect_to owner_path(owner.id)
  end

  private

  def owner_params
    params.require(:owner).permit(:name, :city)
  end
end
