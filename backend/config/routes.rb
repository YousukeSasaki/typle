Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      patch '/users/login_create', to: 'users#login_create'
      resources :questions, only: [:index]
      resources :genres, only: [:index]
      resources :results, only: [:create]
    end
  end
end
