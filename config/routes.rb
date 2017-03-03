Rails.application.routes.draw do
  resources :farms_maps
  resources :events
  devise_for :users
  resources :resource_attachments
  resources :resources
  get 'pages/index'
  get 'calendar' => 'pages#calendar'
  get 'plantdb' => 'pages#resources'
  get 'map' => 'pages#map_florida'
  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
