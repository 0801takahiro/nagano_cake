class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
        @orders = Order.all
    end
end
