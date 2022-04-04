class Public::ItemsController < ApplicationController
   before_action :authenticate_customer!, only: [:show]
    def index
        @items = Item.page(params[:page]).per(6)
        @genres = Genre.all
    end
    
    def show
        @genres = Genre.all
        @items = Item.all
        @item = Item.find(params[:id])
    end
    
    private
    def item_params
        params.require(:item).permit(:genre_id,:name,:introduction,:image,:price)
    end
end
