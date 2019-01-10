Rails.application.routes.draw do
  resources :line_items
  resources :carts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      put '/products/:id/purchase', to: 'products#purchase'
      resources :products
    end
  end
end
