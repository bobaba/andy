Rails.application.routes.draw do
  resources :resources
  get 'pages/index'
  get 'calendar' => 'pages/calendar'
  get 'resources' => 'pages/resources'
  get 'map' => 'pages/map_florida'

  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
