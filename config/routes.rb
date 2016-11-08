Rails.application.routes.draw do
  root "homepage#show"

  namespace :api do
    namespace :v1, defaults {format: :json} do
      
    end
  end

  resources :users, only: [:new, :create]
  resources :links, only: [:index, :create]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
