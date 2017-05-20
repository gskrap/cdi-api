Rails.application.routes.draw do
  resources :locations
  resources :users
  resources :groups
  resources :dance_classes
  resources :sessions, :only => [:create, :destroy]

  get  'teachers'                     => 'users#teachers'
  get  'users/:id/dance_classes'      => 'users#dance_classes'
  get  'users/:id/emergency_contacts' => 'users#emergency_contacts'
  post 'users/:id/emergency_contacts' => 'users#create_emergency_contacts'
  get  'users/:id/groups'             => 'users#get_user_groups'
  post 'users/:id/groups'             => 'users#update_user_groups'
  get  'user_status'                  => 'sessions#user_status'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
