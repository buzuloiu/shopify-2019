Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  resources :users, only: [:create]

  namespace :api do
    namespace :v1 do
      mount Raddocs::App => "/docs"
      put '/products/:id/purchase', to: 'products#purchase'
      put '/carts/:id/complete', to: 'carts#complete'
      put '/carts/:id/add', to: 'carts#add_to_cart'
      get '/line_items/:id/available', to: 'line_items#available'
      put '/line_items/:id/purchase', to: 'line_items#purchase'
      resources :products, only: [:index, :purchase]
      get '/products/:id', to: 'products#show'
      resources :carts, only: [:create, :show, :index]
      resources :line_items
    end
  end
end
