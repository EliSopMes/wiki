Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'events#index'
  resources :events

  get 'developers', to: 'developers#new'
  post 'developers', to: 'developers#create'

  get 'profiles', to: 'profiles#index'
  get 'profiles/:id', to: 'profiles#show', as: 'user'
  get 'profiles/:id/edit', to: 'profiles#edit', as: 'edit_user'
  patch 'profiles/:id', to: 'profiles#update'
end
