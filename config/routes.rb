Rails.application.routes.draw do
  # get 'videos/index'
  # get 'videos/new'
  # get 'videos/create'
  # get 'videos/edit'
  # get 'videos/update'
  # get 'videos/delete'

  root :to => 'videos#index'

  resources :videos
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
