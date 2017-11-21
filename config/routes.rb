Rails.application.routes.draw do
  resources :products

  get 'products_path/products'

  get 'simple_pages/about'

  get 'simple_pages/contact'

  post 'simple_pages/thank_you'

  root 'simple_pages#landing_page'
  
  resources :orders, only: [:index, :show, :create, :destroy]
  
end

