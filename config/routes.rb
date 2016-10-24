require 'api_constraints'
Rails.application.routes.draw do

  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :attendance_records
      resources :cohorts
      resources :users
      get '/students', to: 'students#index'
      get '/me', to: 'users#me'
    end
  end

  get '/login', to: "sessions#new", as: "login"
  get '/auth/:provider/callback', to: "sessions#create"
end
