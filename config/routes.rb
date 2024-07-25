Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tokens, only: %i[create]
      resources :users, only: %i[show create update destroy]
      resources :products
      resources :orders, only: %i[index show create]
    end
  end
end
