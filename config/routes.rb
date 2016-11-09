Rails.application.routes.draw do
  root "homepage#show"

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      patch "/links/mark-as-read", to: "links#update"
      get "/links/sort-alphabetically", to: "links#index"
    end
  end

  resources :users, only: [:new, :create]
  resources :links, only: [:index, :create, :edit, :show, :update]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
