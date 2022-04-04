class Admin::OrderDetailsController < ApplicationController
    def show
        @order_details = OrderDetail.all
        @order_detail = OrderDetail.find(params[:id])
    end
    
    def update
        @order = Order.find(params[:id])
        @order_detail = OrderDetail.find_by(order_id: @order)
        @order_detail.update(order_detail_params)
        redirect_to admin_order_path(@order)
    end
    private
    def order_detail_params
         params.permit(:order_id, :item_id, :amount, :price, :is_active)
    end
end
