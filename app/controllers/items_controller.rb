class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_session, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_user, only: [:edit]

  def index  
    @items = Item.order("created_at DESC")
  end

  def new  
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to root_path
    else
     render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end


  def update
    if @item.update(item_params)
     redirect_to item_path
    else
     render :edit, status: :unprocessable_entity    
    end
  end  

  private

  def item_params
    params.require(:item).permit(:content, :image, :product_name, :description_of_item, :category_id, :condition_id, :shipping_cost_id, :shipping_origin_id, :days_to_ship_id, :price).merge(user_id: current_user.id)  
  end

    def move_to_session
      return if user_signed_in?
      redirect_to new_user_session_path
    end

    def set_item
      @item = Item.find(params[:id])
    end
  
    def move_to_user
      if @item.nil? || current_user.id != @item.user.id
      redirect_to root_path
      end
    end
  end