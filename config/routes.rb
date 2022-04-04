Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  namespace :admin do
    root 'homes#top' 
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
    get 'sign_in' =>'admins/sessions#new'
  end
  namespace :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    get 'orders/thanks' => 'orders#thanks'
    resources :orders, only: [:index, :show, :new, :update, :create]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get 'customers/edit' => 'customers#edit'
    get 'customers/my_page' => 'customers#show'
    get 'customers/checks' => 'customers#checks'
    patch 'customers' => 'customers#update'
    patch 'customers/quit' => 'customers#quit'
    get 'homes' => 'homes#top'
    get 'homes/about' => 'homes#about'
    post 'orders/checks' => 'orders#checks'
    delete 'cart_items' => 'cart_items#destroy_all'
    root 'homes#top'
  end
end
