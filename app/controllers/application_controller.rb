class ApplicationController < ActionController::Base
 
 before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
      if current_admin
        admin_root_path
      else
        public_customers_my_page_path
      end
  end
  def after_sign_out_path_for(resource)
    if resource == :customer
      public_homes_path
    else
      new_admin_session_path
    end
  end
  protected
  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer 
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_active == false)
        flash[:cust] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_registration_path
      else
        flash[:cust] = "項目を入力してください"
      end
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end
    private
     def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
     end
     
end
