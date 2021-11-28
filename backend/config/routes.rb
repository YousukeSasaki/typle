Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      patch '/users/login_create', to: 'users#login_create'
      resources :users, only: [:update] do
        member do
          get :dataview
        end
      end
      resources :questions, only: [:index]
      resources :genres, only: [:index]
      resources :results, only: [:create]
    end
  end
end
