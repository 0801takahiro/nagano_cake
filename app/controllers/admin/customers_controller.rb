class Admin::CustomersController < ApplicationController
    
    def show
        @customers = Customer.all
        @customer = Customer.find(params[:id])
    end
    
    def index
        @customers = Customer.all
    
    end
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
           redirect_to admin_customer(@customer.id)
        else
           render :edit   
        end
    
    end
end
