class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.new

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit( :name, :detail, :condition, :postage, :ship_from, :ship_date, :price, images_attributes: [:img])
  end


end
