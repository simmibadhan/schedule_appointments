Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :schedule_as do
  	member do
      get :this_weeks_schedule
      get :this_weeks_slots
    end
  end
  resources :schedules
end
