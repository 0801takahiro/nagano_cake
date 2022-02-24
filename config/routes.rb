Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  namespace :admin do
    resources :items
    resources :genres
    resources :customers
    get 'sign_in' =>'sessions#new'
    root to: 'homes#top'
  end
  namespace :public do
    resources :addresses
    resources :items
    resources :orders
    resources :genres
    get 'customers/my_page' => 'customers#my_page'
    resources :customers
    resources :registrations
    get 'top' => 'homes#top'
    get 'about' => 'homes#about'
    get 'customers/my_page' => 'customers#show'
    
  end
end
