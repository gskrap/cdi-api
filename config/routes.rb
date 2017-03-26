Rails.application.routes.draw do
  resources :users
  resources :sessions, :only => [:create, :destroy]

  get 'test_admin' => 'test_admin#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
