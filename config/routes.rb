require 'api_constraints'
Rails.application.routes.draw do

  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :holidays
      resources :schedules do 
        resources :attendance_records
      end
      resources :cohorts
      resources :users
      get '/me', to: 'users#me'
      get '/students/:id/attendance_records', to: "students#show"
    end
  end

  get '/login', to: "sessions#new", as: "login"
  get '/auth/:provider/callback', to: "sessions#create"
end
