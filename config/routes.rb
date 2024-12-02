Rails.application.routes.draw do
  get "dashboards/index"
  get "/homes", to: "homes#index"
  devise_for :users, skip: [:sessions]
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  root "dashboards#index"
  get "/dashboards", to: "dashboards#index"
end
