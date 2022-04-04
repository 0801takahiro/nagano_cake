class Admin::ItemsController < ApplicationController
    def index
        @items = Item.page(params[:page]).per(10)
        @genres = Genre.all
    end
    
    def new
        @item = Item.new
        @genres = Genre.all
        @items = Item.all
    end
    
    def create
        @items = Item.all
        @genres = Genre.all
        @item = Item.new(item_params)
        if @item.save!
          redirect_to admin_item_path(@item.id)
        else
          render :index
        end
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def edit
        @item = Item.find(params[:id])
        @genres = Genre.all
    end
    
    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
           redirect_to admin_item_path(@item)
        else
           render :edit
        end
    end
    private
    def item_params
        params.require(:item).permit(:name, :image, :introduction, :price, :genre_id, :is_active)
    end
end
