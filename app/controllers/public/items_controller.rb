class Public::ItemsController < ApplicationController
    before_action :authenticate_customer!, only: [:show]
    def index
        @items = Item.all
        
    end
    def show
        @items = Item.all
        @item = Item.find(params[:id])
        @cart_item = CartItem
    end
    
    private
    def item_params
        params.require(:item).permit(:genre_id,:name,:introduction,:image_id,:price)
    end
end
