Rails.application.routes.draw do
  devise_for :users
  resources :words
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  post "/", to: 'welcome#index'
  get 'suggestions', to: 'welcome#suggestions'
  post 'add_tag', to: 'welcome#add_tag'
end
