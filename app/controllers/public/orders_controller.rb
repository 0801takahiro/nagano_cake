class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
        @cart_items = current_customer.cart_items
    end
    def index
        @orders = current_customer.orders
    end
    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
        @order_detail
    end
    def checks
        @order = Order.new(order_params)
        @order.shipping_cost = '800'
        @order.customer_id = current_customer.id
        @cart_item = current_customer.cart_items
        @total_price = 0
         @cart_item.each do |cart_item|
            @total_price += cart_item.subtotal
         end
        
        if params[:order][:select_address] == '0'
           @order.postal_code = current_customer.postal_code
           @order.address = current_customer.address
           @order.name = current_customer.first_name + current_customer.last_name
        elsif params[:order][:select_address] == '1'
           @address = Address.find(params[:order][:address_id])
           @order.postal_code = @address.postal_code
           @order.address = @address.address
           @order.name = @address.name
        elsif params[:order][:select_address] == '2'
        end
    end
    def create
        @order = Order.new(order_params)
        @items = Item.all
        @order.save
        @cart_items = current_customer.cart_items
         @cart_items.each do |cart_item|
            @order_detail = OrderDetail.new
            @order_detail.order_id = @order.id
            @order_detail.is_active = 0
            @order_detail.amount = cart_item.amount
            @order_detail.price = cart_item.item.add_tax_price
            @order_detail.item_id = cart_item.item.id
            @order_detail.save
         end
         
        
        CartItem.destroy_all
        redirect_to public_orders_thanks_path
    end
    def thanks
    end
    private
     def order_params
        params.require(:order).permit(:customer_id, :payment_method, :total_payment, :address, :postal_code, :name, :shipping_cost, :status)
     end
     def order_detail_params
         params.permit(:order_id, :item_id, :amount, :price, :is_active)
     end
end
