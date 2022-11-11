Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products
  post 'products/new' => 'products#new'
end
