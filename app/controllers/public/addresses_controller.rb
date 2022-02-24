class Public::AddressesController < ApplicationController
    def index
        @addresses = Address.all
        @address = Address.new
    end
    
    def edit
        @address = Address.find(params[:id])
    end
    
    def create
        @addresses = Address.all
        @address = Address.new(address_params)
        redirect_to public_addresses_path
    end
    
    def update
        @address = Address.find(params[:id])
        @address.update(address_params)
        redirect_to public_addresses_path
    end
    
    def destroy
        @address = Address.find(params[:id])
        @address.destroy
        redirect_to public_addresses_path
    end
end
