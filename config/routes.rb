Rails.application.routes.draw do
  # Dashboard Routes
  get "dashboards/index"
  get "/dashboards", to: "dashboards#index"

  # Money Tracker Routes
  resources :money_trackers
  get "/homes", to: "homes#index"

  # Devise Routes
  devise_for :users, skip: [:sessions]
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  # Root Path
  root "dashboards#index"
end
