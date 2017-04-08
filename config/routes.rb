Rails.application.routes.draw do
  resources :users
  resources :dance_classes
  resources :sessions, :only => [:create, :destroy]

  get 'users/:id/classes'   =>          'users#classes'
  get 'user_status'         =>          'sessions#user_status'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
