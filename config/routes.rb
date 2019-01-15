Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      put '/products/:id/purchase', to: 'products#purchase'
      put '/carts/:id/complete', to: 'carts#complete'
      put '/carts/:id/add', to: 'carts#add_to_cart'
      get '/line_items/:id/available', to: 'line_items#available'
      put '/line_items/:id/purchase', to: 'line_items#purchase'
      resources :products, only: [:index, :show, :purchase]
      resources :carts, only: [:create, :show, :index]
      resources :line_items
    end
  end
end
