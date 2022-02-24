class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items.all
  end
  
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart][:item_id])
      cart_item.quantity += params[:cart][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    elsif cart_item.save
      @cart_items = current_customer.cart_items.all
      render 'index'
    else 
      render 'index'
    end
  end
  
  private
   def cart_item_params
     params.require(:cart).permit(:item_id, :price, :amount)
   end
end