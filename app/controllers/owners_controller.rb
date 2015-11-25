class OwnersController < ApplicationController
  def index
    @owners = Owner.all
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

  def destroy
    Owner.destroy(params[:id])
    redirect_to root_path
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.update(params[:id], owner_params)
    redirect_to owner_path
  end

  private

  def owner_params
    params.require(:owner).permit(:name, :city)
  end
end
