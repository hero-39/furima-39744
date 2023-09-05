class ItemsController < ApplicationController

  def index  
   # @items = Item.all
  end

 # def new  
   # @item = Item.new
 # end

 # def create
  #  @itemes = Item.new(item_params)
  #  if @item.save
    # redirect_to root_path
   # else
    #  render :new, status: :unprocessable_entity
  # end
 # end

  private

  def iteme_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
 end