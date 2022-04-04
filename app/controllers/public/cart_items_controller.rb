class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = CartItem.all
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @update_cart_item = CartItem.find_by(item_id: @cart_item.item_id)
    if @update_cart_item.present?
       @update_num = @cart_item.amount+@update_cart_item.amount 
       @update_cart_item.update(amount: @update_num)
       redirect_to public_cart_items_path
    elsif @cart_item.save!
       redirect_to public_cart_items_path
    else 
       render :index
    end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.customer != current_customer
       redirect_to public_cart_items_path
    else
       @cart_item.destroy
       redirect_to public_cart_items_path
    end   
  end
  
  def destroy_all
    CartItem.destroy_all
    redirect_to public_cart_items_path
  end
  
  private
   def cart_item_params
     params.permit(:item_id, :amount, :customer_id)
   end
end