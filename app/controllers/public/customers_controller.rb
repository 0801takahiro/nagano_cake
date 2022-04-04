class Public::CustomersController < ApplicationController
    def show
    end
    def checks
        @customer = Customer.find_by(id: current_customer)
    end
    def edit
        @customer = Customer.find_by(id: current_customer)
    end
    def quit
        @customer = Customer.find_by(id: current_customer)
        @customer.update(is_active: false)
        reset_session
        redirect_to public_homes_path
    end
    def update
        @customer = Customer.find_by(id: current_customer)
        if @customer.update(customer_params)
             redirect_to public_customers_my_page_path
        else 
             render :edit
        end
    end
    def destroy
    end
    private
    def customer_params
        params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
    end
end
