class Admin::HomesController < ApplicationController
    def top
       @order_details = Order_detail.all
       @order_detail = Order_detail.find(params[:id])
    end
end
