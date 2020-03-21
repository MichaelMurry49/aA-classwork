Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  
  get '/users', to: 'users#index', as: 'all_users'
  get '/users/:user_id/artworks', to: 'artworks#index', as: 'all_artwork_under_user'
  # we can nest it this way but we chose to do it in a single route
  # resources :users, except: [:new, :edit] do
  #   resources :artworks, only: [:index]
  # end
  
  post '/users', to: 'users#create', as: 'create_user'
  get '/users/new', to: 'users#new', as: 'return_form_to_create_new_user'
  get '/users/:id', to: 'users#show', as: 'display_specific_user'
  put '/users/:id', to: 'users#update', as: 'update_whole_user'
  get '/users/:id/edit', to: 'users#edit', as: 'return_form_to_edit_user'
  patch '/users/:id', to: 'users#update', as: 'update_user'
  # delete '/users/:id', to: 'users#destroy', as: 'delete_user_by_id'
  delete '/users/:username', to: 'users#destroy', as: 'delete_user_by_username'



  resources :artworks, only: [ :index, :create, :show, :update, :destroy ]

  resources :artworkshares, only: [ :create, :destroy ]

  resources :comments, only: [ :create, :destroy, :index ]
  get '/comments/:user_id/comments', to: 'comments#index', 

  # finish the controller and nest comments route
end
