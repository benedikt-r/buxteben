Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :products do
  resources :comments
  end
  resources :users
  

  get 'products_path/products'

  get 'simple_pages/about'

  get 'simple_pages/index'

  get 'simple_pages/contact'

  post 'simple_pages/thank_you'

  root 'simple_pages#landing_page'

  post 'payments/create'
  
  get 'payments/create'
  

  resources :orders, only: [:index, :show, :create, :destroy]
  
end

