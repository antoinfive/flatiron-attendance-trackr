Rails.application.routes.draw do
  resources :holidays
  resources :attendance_records
  resources :schedules
  resources :cohorts
  resources :users

  get '/login', to: "sessions#new", as: "login"
  get '/auth/:provider/callback', to: "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
