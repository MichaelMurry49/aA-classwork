Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get '/users', to: 'users#index', as: 'all_users'
  post '/users', to: 'users#create', as: 'create_user'
  get '/users/new', to: 'users#new', as: 'return_form_to_create_new_user'
  get '/users/:id', to: 'users#show', as: 'display_specific_user'
  put '/users/:id', to: 'users#update', as: 'update_whole_user'
  get '/users/:id/edit', to: 'users#edit', as: 'return_form_to_edit_user'
  patch '/users/:id', to: 'users#update', as: 'update_user'
  delete '/users/:id', to: 'users#destroy', as: 'delete_user'

end
