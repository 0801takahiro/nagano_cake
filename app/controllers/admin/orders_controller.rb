class Admin::OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
        @order_detail = OrderDetail.find_by(order_id: @order)
    end 
    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        redirect_to admin_order_path(@order)
    end
   private
    def order_params
        params.require(:order).permit(:customer_id, :payment_method, :total_payment, :address, :postal_code, :name, :shipping_cost, :status)
    end
    def order_detail_params
         params.permit(:order_id, :item_id, :amount, :price, :is_active)
    end
end
