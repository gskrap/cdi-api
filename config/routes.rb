Rails.application.routes.draw do
  resources :users
  resources :dance_classes
  resources :sessions, :only => [:create, :destroy]

  get  'teachers'                     => 'users#teachers'
  get  'users/:id/dance_classes'      => 'users#dance_classes'
  get  'users/:id/emergency_contacts' => 'users#emergency_contacts'
  post 'users/:id/emergency_contacts' => 'users#create_emergency_contacts'
  get  'user_status'                  => 'sessions#user_status'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
