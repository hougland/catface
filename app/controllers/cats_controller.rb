class CatsController < ApplicationController
  def index

  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.create(cat_params)
    redirect_to owner_path(params[:owner_id])
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :color, :tail_length, :personality,
      :outdoor, :occupation, :owner_id)
  end
end
