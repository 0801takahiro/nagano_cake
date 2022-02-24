class Admin::ItemsController < ApplicationController
    def index
        @items = Item.all
    end
    
    def new
        @item = Item.new
        
    end
    
    def create
        @item = 
    end
    
    def show
        @items = Item.all
        @item = Item.find(params[:id])
    end
    
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
    end
end
